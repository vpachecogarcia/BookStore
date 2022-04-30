//
//  BookCatalogViewModel.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

class PaginationModel {
    var currentPage: Int
    var hasMorePages: Bool
    let pageSize: Int
    
    init(pageSize: Int) {
        self.pageSize = pageSize
        self.currentPage = 1
        self.hasMorePages = true
    }
    
    var offset: Int {
        return currentPage*pageSize
    }
    
    func clearData() {
        self.currentPage = 1
        self.hasMorePages = true
    }
}

protocol BookCatalogViewModel {
    
    var books: [BookBasicInfoModel]? { get set }
    var catalogUseCase: CatalogUseCase { get }
    var viewState: ViewState { get }
    var paginationModel: PaginationModel { get set }
    
    func paginate()
    func reloadData()
}

class DefaultBookCatalogViewModel: ObservableObject, BookCatalogViewModel {
    
    // data
    @Published var books: [BookBasicInfoModel]?
    
    
    @Published var viewState: ViewState = .loading
    let catalogUseCase: CatalogUseCase
    var paginationModel: PaginationModel
    
    init(catalogUseCase: CatalogUseCase = DefaultCatalogUseCase()) {
        self.catalogUseCase = catalogUseCase
        self.paginationModel = PaginationModel(pageSize: Constants.pageSize)
        self.fetchData()
    }
    
    //MARK: - Private methods
    
    private func fetchData() {
        
        showPaginationLoaderIfNeeded()
        
        let params = CatalogRepositoryParameters(offset: paginationModel.offset, count: paginationModel.pageSize)
        catalogUseCase.execute(params: params) { result in
            switch result {
            case .success(let entity):
                
                guard !entity.isEmpty else {
                    self.handleEmptyState()
                    return
                }
                
                self.stopPaginationLoader()
                
                if entity.count < self.paginationModel.pageSize {
                    // stops pagination if no more data available
                    self.paginationModel.hasMorePages = false
                }
                
                self.bookBuilder(entity: entity)
                
            case .failure(let _):
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }
    
    private func bookBuilder(entity: BookListEntity) {
        var books = [BookBasicInfoModel]()
        entity.forEach { bookEntity in
            books.append(BookBasicInfoModel(entity: bookEntity))
        }
        
        self.books = books
    }
    
    private func showPaginationLoaderIfNeeded() {
        if paginationModel.currentPage != 1 {
            DispatchQueue.main.async {
                self.viewState = .paging
            }
        }
    }
    
    private func stopPaginationLoader() {
        DispatchQueue.main.async {
            self.viewState = .presenting
        }
    }
    
    private func handleEmptyState() {
        if paginationModel.currentPage != 1 {
            // No more books
            self.paginationModel.hasMorePages = false
        } else {
            // No books available in first page. Show empty state
            DispatchQueue.main.async {
                self.viewState = .emptyState
            }
        }
    }
    
    private func clearData(completion: @escaping ()->()) {
        DispatchQueue.main.async {
            self.viewState = .loading
            self.paginationModel.clearData()
        }
    }
    
    //MARK: - Internal methods
    
    func paginate() {
        self.paginationModel.currentPage += 1
    }
    
    func reloadData() {
        self.clearData {
            self.fetchData()
        }
    }
    
    //MARK: - Constants
    
    private enum Constants {
        static let pageSize: Int = 10
    }
    
}
