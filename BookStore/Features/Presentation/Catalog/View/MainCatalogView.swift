//
//  BookCatalogView.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

struct BookCatalogView: View {
    
    @StateObject var viewModel = BookCatalogViewModel()
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .modifier(LoadableViewModifier(state: viewModel.viewState))
    }
}

struct BookCatalogView_Previews: PreviewProvider {
    static var previews: some View {
        BookCatalogView()
    }
}
