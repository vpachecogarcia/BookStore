//
//  BookDetailDecodable.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

struct BookDetailDecodable: Codable {
    
    var image: String?
    var title: String?
    var author: String?
    var price: Decimal?

}
