//
//  MockApi.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

protocol MockApi {
    func request<T>(resource: String, completion: @escaping (Result<T, DataTransferError>) -> Void)  where T : Decodable
}

final class DefaultMockApi: MockApi {
    
    let decoder = JSONDecoder()
    
    func request<T>(resource: String, completion: @escaping (Result<T, DataTransferError>) -> Void)  where T : Decodable {
        let delay = DispatchTimeInterval.seconds(Int.random(in: (1..<4)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            if let path = Bundle.main.path(forResource: resource, ofType: "txt") {
                do {
                    let json = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                    do {
                        let catalogDecodable = try self.decoder.decode(T.self, from: Data(json.utf8))
                        completion(.success(catalogDecodable))
                    } catch {
                        let error = DataTransferError.service(code: 400, title: "BAD REQUEST", detail: nil)
                        completion(.failure(error))
                    }
                    
                } catch {
                    completion(.failure(.service(code: 404, title: "NOT FOUND", detail: nil)))
                }
            } else {
                completion(.failure(.service(code: 400, title: "BAD REQUEST", detail: nil)))
            }
        }
    }
    
}
