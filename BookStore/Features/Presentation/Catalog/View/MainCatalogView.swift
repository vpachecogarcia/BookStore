//
//  BookCatalogView.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

struct BookCatalogView: View {
    
    @StateObject var viewModel = DefaultBookCatalogViewModel()
    @State var viewState: ViewState = .loading
    
    var body: some View {
        contentView
            .modifier(LoadableViewModifier(state: $viewState))
            .onChange(of: viewModel.viewState) { newState in
                viewState = newState
            }
    }
    
    @ViewBuilder var contentView: some View {
        if let books = viewModel.books {
            List(books) {
                Text($0.title)
            }
        } else {
            EmptyView()
        }
    }
}

struct BookCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BookCatalogView()
    }
}
