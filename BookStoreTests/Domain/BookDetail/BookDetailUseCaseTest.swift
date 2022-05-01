//
//  BookDetailUseCaseTest.swift
//  BookStoreTests
//
//  Created by Victor Pacheco on 1/5/22.
//

import XCTest
@testable import BookStore

class BookDetailUseCaseTest: XCTestCase {
    
    func testBookDetail_whenSuccessfully() {
        let expt = self.expectation(description: "\(#function)")
        
        let repository = BoodDetailRepositorySuccessMock()
        let useCase = DefaultBookDetailUseCase(repository: repository)
        
        useCase.execute(link: "ulysses") { result in
            
            switch result {
            case .success(let entity):
                self.validateSuccessBookDetailEntity(entity: entity)
            case .failure(let error):
                XCTAssertNil(error)
            }
            expt.fulfill()
        }
        wait(for: [expt], timeout: 3)
    }
    
    private func validateSuccessBookDetailEntity(entity: BookDetailEntity) {
        XCTAssertEqual(entity.title, "Ulysses")
        XCTAssertEqual(entity.author, "James Joyce")
        XCTAssertEqual(entity.image, "https://d3i5mgdwi2ze58.cloudfront.net/usuab7s8yuwlcmadwx9woy746lvi")
        XCTAssertEqual(entity.price, 19.70)
        
    }
}



