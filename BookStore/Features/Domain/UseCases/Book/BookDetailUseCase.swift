//
//  BookDetailUseCase.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

protocol BookDetailUseCase {
    func execute(link: String, completion: @escaping (Result<BookDetailEntity, DataTransferError>) -> ())
}

final class DefaultBookDetailUseCase: BookDetailUseCase {
    
    private let repository: BookDetailRepository
    
    init(repository: BookDetailRepository = DefaultBookDetailRepository()) {
        self.repository = repository
    }
    
    //MARK: - BoockDetail use case protocol functions
    func execute(link: String, completion: @escaping (Result<BookDetailEntity, DataTransferError>) -> ()) {
        repository.getBookDetail(link: link) { result in
            switch result {
            case .success(let decodable):
                if let entity = BookDetailEntity(decodable: decodable) {
                    completion(.success(entity))
                } else {
                    completion(.failure(.parse))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
