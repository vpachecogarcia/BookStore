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
                    withAnimation { viewState = newState }
                }
        }
        .background(Color.stormCloud)
    }
    
    
    // MARK - Accessory views
    
    @ViewBuilder var contentView: some View {
        if !viewModel.books.isEmpty {
            List(viewModel.books) { book in
                CatalogRowView(book: book)
                    .onAppear {
                        if book == viewModel.books.last,
                           viewModel.viewState != .paging,
                            viewModel.hasMorePages {
                            self.paginate()
                        }
                    }
            }
            .listStyle(.plain)
            .navigationTitle(Localizables.navigationTitle)
            .refreshable {
                viewModel.reloadData()
            }
        }
    }
    
    
    // MARK - Private methods
    
    private func paginate() {
        DispatchQueue.main.async {
            self.viewModel.viewState = .paging
            self.viewModel.paginate()
        }
    }
    
    
    // MARK - Constants
    
    enum Localizables {
        static let navigationTitle = "Books Catalog"
    }
}
