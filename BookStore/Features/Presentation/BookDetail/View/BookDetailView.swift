//
//  BookDetailView.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import SwiftUI

struct BookDetailView: View {
    
    @StateObject var viewModel: DefaultBookDetailViewModel
    @State var viewState: ViewState = .loading
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Spacer()
                    imageView
                        .frame(height: proxy.size.height * 0.4)
                    Spacer()
                }
                
                detailView
                    .padding(.horizontal, 16)
                
                Spacer()
            }
        }
        .modifier(LoadableViewModifier(state: $viewState,
                                       reloadPressed: viewModel.fetchData))
        
        .onChange(of: viewModel.viewState) { newState in
            self.viewState = newState
        }
    }
    
    
    //MARK: - Accessory views
    
    @ViewBuilder private var imageView: some View {
        if let imageUrl = viewModel.book?.image, let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                placeHolderImage
            }

        } else {
            placeHolderImage
        }
    }
    
    private var placeHolderImage: some View {
        Image("placeholder_book")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
    private var detailView: some View {
        VStack(alignment: .leading, spacing: 16) {
            titleView
            authorView
            priceView
        }
    }
    
    @ViewBuilder private var titleView: some View {
        if let title = viewModel.book?.title {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
        }
    }
    
    @ViewBuilder private var authorView: some View {
        if let author = viewModel.book?.author {
            Text("By \(author)")
                .font(.headline)
                .fontWeight(.semibold)
        }
    }
    
    @ViewBuilder private var priceView: some View {
        if let price = viewModel.book?.price {
            HStack {
                Spacer()
                Text("\(price.description)€")
                    .font(.system(.title2, design: .monospaced))
                    .padding(.vertical, 4)
                    .padding(.horizontal, 12)
                    .background(
                        Color.weldonBlue
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                    )
            }
        }
    }
    
}
