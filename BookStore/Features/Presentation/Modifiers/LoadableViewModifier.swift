//
//  LoadableViewModifier.swift
//  BookStore
//
//  Created by sopra on 30/4/22.
//

import SwiftUI

enum ViewState {
    case loading
    case error
    case emptyState
    case presenting
}

struct LoadableViewModifier: ViewModifier {
    
    @State var state: ViewState
    
    func body(content: Content) -> some View {
        switch state {
        case .loading:
            loaderView
        case .error:
            errorView
        case .emptyState:
            emtptyStateView
        case .presenting:
            content
        }
    }
    
    private var loaderView: some View {
        Text("Loading")
    }
    
    private var errorView: some View {
        Text("Error")
    }
    
    private var emtptyStateView: some View {
        Text("EmptyState")
    }
    
}
    
