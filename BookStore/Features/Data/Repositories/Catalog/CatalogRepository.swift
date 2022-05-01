//
//  CatalogRepository.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

final class DefaultCatalogRepository: CatalogRepository {
    
    let mockApi: MockApi
    
    init(mockApi: MockApi = DefaultMockApi()) {
        self.mockApi = mockApi
    }
    
    func getCatalog(parameters: CatalogRepositoryParameters, completion: @escaping (Result<[BookBasicInfoDecodable], DataTransferError>) -> Void) {
        
        mockApi.request(resource: getPath(for: parameters), completion: completion)
    }
    
    private func getPath(for params: CatalogRepositoryParameters) -> String {
        guard let offset = params.offset else {
            return Constants.page1
        }
        if offset < 10 {
            return Constants.page1
        } else if offset < 20 {
            return Constants.page2
        } else {
            return Constants.page3
        }
    }
    
    private enum Constants {
        static let page1 = "page1"
        static let page2 = "page2"
        static let page3 = "emptyData"
    }
    
}
