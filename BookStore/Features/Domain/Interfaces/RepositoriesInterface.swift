//
//  RepositoriesInterface.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

//MARK: - Catalog

protocol CatalogRepository {
    func getCatalog(parameters: CatalogRepositoryParameters, completion: @escaping (Result<[BookBasicInfoDecodable], DataTransferError>) -> Void)
}


//MARK: - Book detail

protocol BookDetailRepository {
    func getBookDetail(link: String, completion: @escaping (Result<BookDetailDecodable, DataTransferError>) -> Void)
}
