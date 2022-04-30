//
//  DataTransferError.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

enum DataTransferError: Error {
    case service(code: Int, title: String?, detail: String?)
    case parse
    case emptyData
    case timedOut
    case noPagesAvailable
}
