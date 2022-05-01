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
        NavigationLink {
            BookDetailView(viewModel: DefaultBookDetailViewModel(link: book.link))
        } label: {
            Text(book.title)
                .lineLimit(2)
                .foregroundColor(.white)
                .padding(.vertical, 16)
        }
        .listRowBackground(Color.stormCloud)
        .listRowSeparatorTint(Color.weldonBlue)
    }
}
