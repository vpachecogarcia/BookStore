//
//  BookCatalogViewModel.swift
//  BookStore
//
//  Created by sopra on 30/4/22.
//

import Foundation

class BookCatalogViewModel: ObservableObject {
    
    var currentPage: Int = 1
    @Published var viewState: ViewState = .loading
    
    init() {
        self.fetchData()
    }
    
    private func fetchData() {
        let params = CatalogRepositoryParameters(offset: offset, count: Constants.pageSize)
        DefaultCatalogRepository().getCatalog(parameters: params) { result in
            switch result {
            case .success(let decodable):
                debugPrint(decodable.count)
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
    private var offset: Int {
        currentPage*Constants.pageSize
    }
    
    private enum Constants {
        static let pageSize: Int = 10
    }
    
}
