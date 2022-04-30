//
//  CatalogUseCase.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

protocol CatalogUseCase {
    func execute(params: CatalogRepositoryParameters, completion: @escaping (Result<BookListEntity, DataTransferError>) -> ())
}

final class DefaultCatalogUseCase: CatalogUseCase {
    
    private let repository: CatalogRepository
    
    init(repository: CatalogRepository = DefaultCatalogRepository()) {
        self.repository = repository
    }
    
    func execute(params: CatalogRepositoryParameters, completion: @escaping (Result<BookListEntity, DataTransferError>) -> ()) {
        
        let completion = { (result: Result<BookListDecodable, DataTransferError>) in
            switch result {
            case .success(let decodable):
                
                var books = [BookBasicInfoEntity]()
                decodable.forEach { bookDecodable in
                    if let book = BookBasicInfoEntity(decodable: bookDecodable) {
                        books.append(book)
                    }
                }
                
                books.isEmpty ? completion(.failure(.parse)) : completion(.success(books))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        self.repository.getCatalog(parameters: params, completion: completion)
    }
}
