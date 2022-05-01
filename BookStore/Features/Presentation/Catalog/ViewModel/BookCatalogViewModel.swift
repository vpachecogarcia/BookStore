//
//  BookCatalogViewModel.swift
//  BookStore
//
//  Created by Victor Pacheco on 30/4/22.
//

import Foundation

protocol BookCatalogViewModel {
    
    var books: [BookBasicInfoModel] { get set }
    var catalogUseCase: CatalogUseCase { get }
    var viewState: ViewState { get }
    var hasMorePages: Bool { get set }
    
    func paginate()
    func reloadData()
}

class DefaultBookCatalogViewModel: ObservableObject, BookCatalogViewModel {
    
    @Published var books = [BookBasicInfoModel]()
    @Published var viewState: ViewState = .loading
    let catalogUseCase: CatalogUseCase
    var hasMorePages: Bool = true
    
    init(catalogUseCase: CatalogUseCase = DefaultCatalogUseCase()) {
        self.catalogUseCase = catalogUseCase
        self.fetchData()
    }
    
    
    //MARK: - Private methods
    
    private func fetchData(isReload: Bool? = nil) {
        
        catalogUseCase.execute(isReload: isReload) { result in
            switch result {
            case .success(let entity):
                self.bookBuilder(entity: entity)
                self.hasMorePages = entity.hasMorePages
                self.stopPaginationLoader()
                
            case .failure(let error):
                self.handleError(error: error)
            }
        }
    }
    
    private func bookBuilder(entity: CatalogEntity) {
        entity.books.forEach { bookEntity in
            books.append(BookBasicInfoModel(entity: bookEntity))
        }
    }
    
    private func handleError(error: DataTransferError) {
        switch error {
        case .noPagesAvailable:
            self.hasMorePages = false
            DispatchQueue.main.async {
                self.viewState = .presenting
            }
        case .emptyData:
            DispatchQueue.main.async {
                self.viewState = .emptyState
            }
        default:
            DispatchQueue.main.async {
                self.viewState = .error
            }
        }
    }
    
    private func stopPaginationLoader() {
        DispatchQueue.main.async {
            self.viewState = .presenting
        }
    }
    
    private func clearData(completion: @escaping ()->()) {
        DispatchQueue.main.async {
            self.viewState = .loading
            self.books.removeAll()
            completion()
        }
    }
    
    
    //MARK: - Internal methods
    
    func paginate() {
        if hasMorePages {
            self.fetchData()
        }
        
    }
    
    func reloadData() {
        self.clearData {
            self.fetchData(isReload: true)
        }
    }
    
    
    //MARK: - Constants
    
    private enum Constants {
        static let pageSize: Int = 10
    }
    
}
