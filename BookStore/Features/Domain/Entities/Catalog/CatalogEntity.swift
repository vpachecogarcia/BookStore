//
//  CatalogEntity.swift
//  BookStore
//
//  Created by sopra on 30/4/22.
//

import Foundation

struct CatalogEntity {
    var books: [BookBasicInfoEntity]
    var hasMorePages: Bool
    
    init(decodable: BookListDecodable, pageSize: Int) {
        var books = [BookBasicInfoEntity]()
        decodable.forEach { bookDecodable in
            if let book = BookBasicInfoEntity(decodable: bookDecodable) {
                books.append(book)
            }
        }
        self.books = books
        
        self.hasMorePages = decodable.count >= pageSize
    }
}
