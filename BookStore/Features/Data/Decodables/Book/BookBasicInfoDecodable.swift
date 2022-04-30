//
//  BookBasicInfoDecodable.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation
/* {
    “id”: 33,
    “link”: “/api/v1/items/33”,
    “title”: “The Wizard of Oz”,
} */

struct BookBasicInfoDecodable: Codable {
    var id: Int?
    var link: String?
    var title: String?
}

typealias BookListDecodable = [BookBasicInfoDecodable]
