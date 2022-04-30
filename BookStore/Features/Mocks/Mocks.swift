//
//  Mocks.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

enum Mocks {
    
    case catalogPage1Success
    case catalogPage2Success
    case catalogEmptyData
    case badRequest
    
    var data: Data {
        switch self {
        case .catalogPage1Success:
            return Data(Constants.catalogPage1Success.utf8)
        case .catalogPage2Success:
            return Data(Constants.catalogPage2Success.utf8)
        case .catalogEmptyData:
            return Data(Constants.catalogEmptyDataMock.utf8)
        case .badRequest:
            return Data(Constants.badRequest.utf8)
        }
    }
    
    enum Constants {
        static let catalogPage1Success = """
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
        static let catalogPage2Success = """
            [{
                "id": 11,
                "link": "/api/v1/items/11",
                "title": "The Odyssey"
            },{
                "id": 12,
                "link": "/api/v1/items/12",
                "title": "Madame Bovary"
            },{
                "id": 13,
                "link": "/api/v1/items/13",
                "title": "The Divine Comedy"
            },{
                "id": 14,
                "link": "/api/v1/items/14",
                "title": "Alice's Adventures in Wonderland"
            },{
                "id": 15,
                "link": "/api/v1/items/15",
                "title": "To the Lighthouse"
            },{
                "id": 16,
                "link": "/api/v1/items/16",
                "title": "The Sound and the Fury"
            },{
                "id": 17,
                "link": "/api/v1/items/17",
                "title": "The Grapes of Wrath"
            },{
                "id": 18,
                "link": "/api/v1/items/18",
                "title": "Invisible Man"
            },{
                "id": 19,
                "link": "/api/v1/items/19",
                "title": "Gulliver's Travels"
            },{
                "id": 20,
                "link": "/api/v1/items/20",
                "title": "The Stranger"
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
