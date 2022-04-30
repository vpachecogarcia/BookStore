//
//  ServiceErrorDecodable.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

/* {
     "status": 422,
     "code": "INVALID_ID",
     "message": "The id typo is invalid"
} */

public struct ServiceErrorDecodable: Codable {
    var status: Int?
    var code: String?
    var message: String?
}
