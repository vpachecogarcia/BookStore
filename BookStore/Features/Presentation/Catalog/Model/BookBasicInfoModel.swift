//
//  BookBasicInfoModel.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

struct BookBasicInfoModel: Identifiable {
    let id: Int
    let link: String
    let title: String
    
    init(entity: BookBasicInfoEntity) {
        self.id = entity.id
        self.link = entity.link
        self.title = entity.title
    }
}
