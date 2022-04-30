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
        let json = Mocks.catalogSuccess.data
        let decoder = JSONDecoder()
        
        do {
            let catalogDecodable = try decoder.decode(BookListDecodable.self, from: json)
            completion(.success(catalogDecodable))
        } catch {
            let error = DataTransferError.service(code: 400, title: "BAD REQUEST", detail: nil)
            completion(.failure(error))
        }
    }
    
    
}
