//
//  BoodDetailRepositorySuccessMock.swift
//  BookStoreTests
//
//  Created by Victor Pacheco on 1/5/22.
//

import XCTest
@testable import BookStore

extension BookDetailUseCaseTest {
    class BoodDetailRepositorySuccessMock: BookDetailRepository {
        
        let mockAPI = DefaultMockApi()
        
        func getBookDetail(link: String, completion: @escaping (Result<BookDetailDecodable, DataTransferError>) -> Void) {
            mockAPI.request(resource: "ulysses", completion: completion)
        }
    }
}
