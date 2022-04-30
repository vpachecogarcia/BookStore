//
//  Mocks.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

enum Mocks {
    
    case catalogSuccess
    case catalogEmptyData
    case badRequest
    
    var data: Data {
        switch self {
        case .catalogSuccess:
            return Data(Constants.catalogSuccessMock.utf8)
        case .catalogEmptyData:
            return Data(Constants.catalogEmptyDataMock.utf8)
        case .badRequest:
            return Data(Constants.badRequest.utf8)
        }
    }
    
    enum Constants {
        static let catalogSuccessMock = """
            [{
                "id": 1,
                "link": "/api/v1/items/1",
                "title": "Steppenwolf"
            },
            {
                "id": 2,
                "link": "/api/v1/items/2",
                "title": "The Wizard of Oz"
            },
            {
                "id": 3,
                "link": "/api/v1/items/3",
                "title": "In Search of Lost Time"
            },
            {
                "id": 4,
                "link": "/api/v1/items/4",
                "title": "Ulysses"
            },
            {
                "id": 5,
                "link": "/api/v1/items/5",
                "title": "Don Quijote"
            },
            {
                "id": 6,
                "link": "/api/v1/items/6",
                "title": "One Hundred Years of Solitude"
            },
            {
                "id": 7,
                "link": "/api/v1/items/7",
                "title": "The Great Gatsby"
            },
            {
                "id": 8,
                "link": "/api/v1/items/9",
                "title": "Moby Dick"
            },
            {
                "id": 9,
                "link": "/api/v1/items/9",
                "title": "Hamlet"
            },
            {
                "id": 10,
                "link": "/api/v1/items/10",
                "title": "Lolita"
            }]
            """
        static let catalogEmptyDataMock = "{[]}"
        static let badRequest = """
            {
                "status": 400,
                "code": "BAD REQUEST",
                "message": "The request cannot be fulfilled due to bad syntax"
            }
            """
    }

}
