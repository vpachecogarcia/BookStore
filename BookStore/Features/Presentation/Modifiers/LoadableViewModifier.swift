//
//  LoadableViewModifier.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

enum ViewState {
    case loading
    case error
    case emptyState
    case presenting
    case paging
}

struct LoadableViewModifier: ViewModifier {
    
    @Binding var state: ViewState
    
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
        case .paging:
            VStack() {
                content
                progressView
            }
            .background(Color.stormCloud)
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
    
    private var progressView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(width: 48, height: 48)
            .padding(.vertical, 30)
    }

}
    
