//
//  RepositoriesInterface.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

protocol CatalogRepository {
    func getCatalog(parameters: CatalogRepositoryParameters, completion: @escaping (Result<[BookBasicInfoDecodable], DataTransferError>) -> Void)
}
