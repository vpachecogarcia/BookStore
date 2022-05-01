//
//  ErrorView.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import SwiftUI

enum ErrorViewType {
    case emptyState
    case genericError
    
    var title: String {
        switch self {
        case .emptyState:
            return Localizables.emptyState
        case .genericError:
            return Localizables.genericError
        }
    }
    
    var icon: String {
        switch self {
        case .emptyState:
            return Icons.emptyState
        case .genericError:
            return Icons.genericError
        }
    }
    
    enum Localizables {
        static let emptyState = "There is no books available"
        static let genericError = "An error has ocurred"
    }
    
    enum Icons {
        static let emptyState = "book"
        static let genericError = "exclamationmark.circle"
    }
}

struct ErrorView: View {
    
    var type: ErrorViewType
    var reloadPressed: () -> ()
    
    var body: some View {
        VStack(spacing: 32) {
            Spacer()
            iconView
            Text(type.title).fontWeight(.semibold)
            Text(Localizables.description).fontWeight(.regular)
            Spacer()
            buttonView
                .padding(.bottom, 40)
        }
        .foregroundColor(Color.stormCloud)
    }
    
    private var iconView: some View {
        Image(systemName: type.icon)
            .font(.system(size: 60))
    }
    
    private var buttonView: some View {
        Button {
            reloadPressed()
        } label: {
            Text(Localizables.button)
                .foregroundColor(.white)
        }
        .buttonStyle(.borderedProminent)
        .buttonBorderShape(.capsule)
        
    }
    
    enum Localizables {
        static let description = "Please try again later"
        static let button = "Try again"
    }
}
