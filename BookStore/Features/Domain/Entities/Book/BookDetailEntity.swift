//
//  BookDetailEntity.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

struct BookDetailEntity {
    
    var image: String?
    var title: String
    var author: String?
    var price: Decimal?
    
    init?(decodable: BookDetailDecodable) {
        guard let title = decodable.title else { return nil }
        self.image = decodable.image
        self.title = title
        self.author = decodable.author
        self.price = decodable.price
    }
}
