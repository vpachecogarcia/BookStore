//
//  CatalogRepository.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

final class DefaultCatalogRepository: CatalogRepository {
    
    private enum Constants {
        static let path = "/api/v1/items"
    }
    
    func getCatalog(parameters: CatalogRepositoryParameters, completion: @escaping (Result<[BookBasicInfoDecodable], DataTransferError>) -> Void) {
        
        let json = getJson(for: parameters)
        let decoder = JSONDecoder()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            do {
                let catalogDecodable = try decoder.decode(BookListDecodable.self, from: json)
                completion(.success(catalogDecodable))
            } catch {
                let error = DataTransferError.service(code: 400, title: "BAD REQUEST", detail: nil)
                completion(.failure(error))
            }
        }
    }
    
    private func getJson(for params: CatalogRepositoryParameters) -> Data {
        guard let offset = params.offset else {
            return Mocks.catalogPage1Success.data
        }
        if offset < 10 {
            return Mocks.catalogPage1Success.data
        } else if offset < 20 {
            return Mocks.catalogPage2Success.data
        } else {
            return Mocks.catalogEmptyData.data
        }
    }
    
}
