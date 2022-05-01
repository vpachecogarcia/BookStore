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
    @State var showDialog: Bool = false
    
    var body: some View {
        NavigationView {
            contentView
                .modifier(LoadableViewModifier(state: $viewState,
                                               backgroundColor: .stormCloud,
                                               reloadPressed: viewModel.reloadData))
                          
                .onChange(of: viewModel.viewState) { newState in
                    withAnimation { viewState = newState }
                }
            
                .background(Color.stormCloud.ignoresSafeArea())
                .navigationBarItems(trailing: addButtonView)
                .alert(isPresented: $showDialog) {
                    alertView
                }
        }
    }
    
    
    // MARK - Accessory views
    
    @ViewBuilder var contentView: some View {
        if !viewModel.books.isEmpty {
            List(viewModel.books) { book in
                CatalogRowView(book: book)
                    .disabled(viewState == .paging)
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

    
    private var addButtonView: some View {
        Button {
            showDialog.toggle()
        } label: {
            Image(systemName: Icons.add)
                .font(.system(size: 24))
                .foregroundColor(.weldonBlue)
        }
    }
    
    private var alertView: Alert {
        Alert(title: Text(Localizables.alertTitle),
              message: Text(Localizables.alertMessage),
              dismissButton: .default(Text(Localizables.alertButton)))
    }
    
    
    // MARK - Private methods
    
    private func paginate() {
        DispatchQueue.main.async {
            self.viewModel.viewState = .paging
            self.viewModel.paginate()
        }
    }
    
    
    // MARK - Constants
    
    private enum Localizables {
        static let navigationTitle = "Books Catalog"
        static let alertTitle = "We're sorry"
        static let alertMessage = "This feature is not available yet"
        static let alertButton = "Ok"
    }
    
    private enum Icons {
        static let add = "plus"
    }
}
