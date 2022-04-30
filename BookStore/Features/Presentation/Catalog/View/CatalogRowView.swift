//
//  CatalogRowView.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

struct CatalogRowView: View {
    
    var book: BookBasicInfoModel
    
    var body: some View {
        Text(book.title)
            .lineLimit(2)
            .foregroundColor(.white)
            .listRowBackground(Color.stormCloud)
            .listRowSeparatorTint(Color.weldonBlue)
            .padding(.vertical, 16)
    }
}
