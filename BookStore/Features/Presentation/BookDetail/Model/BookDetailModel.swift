//
//  BookDetailModel.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

struct BookDetailModel {
    
    var image: String?
    var title: String
    var author: String?
    var price: Decimal?
    
    init(image: String? = nil, title: String, author: String? = nil, price: Decimal? = nil) {
        self.image = image
        self.title = title
        self.author = author
        self.price = price
    }
    
    init(entity: BookDetailEntity) {
        self.image = entity.image
        self.title = entity.title
        self.author = entity.author
        self.price = entity.price
    }
}
