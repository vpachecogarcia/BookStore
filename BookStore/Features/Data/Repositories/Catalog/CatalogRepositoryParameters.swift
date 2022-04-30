//
//  CatalogRepositoryParameters.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

struct CatalogRepositoryParameters: Encodable {
    
    var offset: Int?     // skip this number of items before returning to provide paging functionality
    var count: Int?      // returning number of items
}
