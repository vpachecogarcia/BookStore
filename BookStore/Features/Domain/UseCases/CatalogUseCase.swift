//
//  CatalogUseCase.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

protocol CatalogUseCase {
    func execute(isReload: Bool?, completion: @escaping (Result<CatalogEntity, DataTransferError>) -> ())
}

final class DefaultCatalogUseCase: CatalogUseCase {
    
    private let repository: CatalogRepository
    var paginationModel: PaginationModel
    
    init(repository: CatalogRepository = DefaultCatalogRepository()) {
        self.paginationModel = PaginationModel(pageSize: Constants.pageSize)
        self.repository = repository
    }
    
    //MARK: - CatalogUseCase protocol functions
    
    func execute(isReload: Bool? = nil, completion: @escaping (Result<CatalogEntity, DataTransferError>) -> ()) {
        
        if isReload ?? false {
            paginationModel.clearData()
        }
        
        let params = CatalogRepositoryParameters(offset: paginationModel.offset, count: paginationModel.pageSize)
        
        let completion = { (result: Result<BookListDecodable, DataTransferError>) in
            switch result {
            case .success(let decodable):
                
                let catalog = CatalogEntity(decodable: decodable, pageSize: self.paginationModel.pageSize)
                self.paginationModel.hasMorePages = catalog.hasMorePages
                
                if catalog.books.isEmpty {
                    completion(.failure(self.paginationModel.currentPage == 1 ? .emptyData : .noPagesAvailable))
                } else {
                    self.paginationModel.currentPage += 1
                    completion(.success(catalog))
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
        
        self.repository.getCatalog(parameters: params, completion: completion)
    }
    
    
    //MARK: - Constants
    
    private enum Constants {
        static let pageSize: Int = 10
    }
}
