//
//  DataTransferError.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

enum DataTransferError: Error {
    case service(code: Int, detail: String?)
    case parse(Error)
    case emptyData
    case timedOut
}
