//
//  BookBasicInfoEntity.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

struct BookBasicInfoEntity {
    var id: Int
    var link: String
    var title: String
    
    init?(decodable: BookBasicInfoDecodable) {
        guard let id = decodable.id, let link = decodable.link, let title = decodable.title else { return nil}
        self.id = id
        self.link = link
        self.title = title
    }
}
