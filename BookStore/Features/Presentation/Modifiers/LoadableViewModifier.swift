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
    var backgroundColor: Color?
    var reloadPressed: () -> ()
    
    func body(content: Content) -> some View {
        switch state {
        case .loading:
            loaderView
        case .error:
            ErrorView(type: .genericError, reloadPressed: reloadPressed)
        case .emptyState:
            ErrorView(type: .emptyState, reloadPressed: reloadPressed)
        case .presenting:
            content
        case .paging:
            VStack() {
                content
                progressView
            }
            .background(backgroundColor ?? .clear)
        }
    }
    
    private var loaderView: some View {
        ZStack {
            backgroundColor ?? .clear
            SpinnerView()
        }
        .ignoresSafeArea()
    }
    
    private var progressView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(width: 48, height: 48)
            .padding(.vertical, 30)
    }

}
    
