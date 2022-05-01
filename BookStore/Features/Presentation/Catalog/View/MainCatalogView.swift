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
        NavigationView {
            contentView
                .modifier(LoadableViewModifier(state: $viewState, reloadPressed: {
                    viewModel.reloadData()
                }))
                .onChange(of: viewModel.viewState) { newState in
                    viewState = newState
                }
        }
        .background(Color.stormCloud)
    }
    
    @ViewBuilder var contentView: some View {
        if !viewModel.books.isEmpty {
            List(viewModel.books) { book in
                CatalogRowView(book: book)
                    // Gives the chance to add a block of logic
                    .background(GeometryReader { geometry -> Color in
                        if book == viewModel.books.last && viewState != .paging {
                            viewModel.paginate()
                        }
                        return Color.clear
                    })
            }
            .listStyle(.plain)
            .navigationTitle("Books Catalog")
            .refreshable {
                viewModel.reloadData()
            }
        }
    }
}

struct BookCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BookCatalogView()
    }
}
