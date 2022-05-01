//
//  BookDetailRepository.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

final class DefaultBookDetailRepository: BookDetailRepository {
    
    let mockApi: MockApi
    
    init(mockApi: MockApi = DefaultMockApi()) {
        self.mockApi = mockApi
    }
    
    func getBookDetail(link: String, completion: @escaping (Result<BookDetailDecodable, DataTransferError>) -> Void) {
        
        mockApi.request(resource: link.replacingOccurrences(of: Constants.baseUrl, with: ""), completion: completion)
    }
    
    enum Constants {
        static let baseUrl = "/api/v1/items/"
    }
}
