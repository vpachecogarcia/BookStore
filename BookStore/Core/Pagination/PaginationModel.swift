//
//  PaginationModel.swift
//  BookStore
//
//  Created by sopra on 30/4/22.
//

import Foundation

class PaginationModel {
    var currentPage: Int
    var hasMorePages: Bool
    let pageSize: Int
    
    init(pageSize: Int) {
        self.pageSize = pageSize
        self.currentPage = 1
        self.hasMorePages = true
    }
    
    var offset: Int {
        return (currentPage*pageSize) - pageSize
    }
    
    func clearData() {
        self.currentPage = 1
        self.hasMorePages = true
    }
}
