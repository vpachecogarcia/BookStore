//
//  BookDetailViewModel.swift
//  BookStore
//
//  Created by Victor Pacheco on 1/5/22.
//

import Foundation

protocol BookDetailViewModel {
    
    var book: BookDetailModel? { get set }
    var link: String { get }
    var bookDetailUseCase: BookDetailUseCase { get }
    var viewState: ViewState { get set }
    
    func fetchData()
}

class DefaultBookDetailViewModel: ObservableObject, BookDetailViewModel {
    
    @Published var book: BookDetailModel? 
    @Published var viewState: ViewState = .loading
    let link: String
    let bookDetailUseCase: BookDetailUseCase
    
    init(link: String, bookDetailUseCase: BookDetailUseCase = DefaultBookDetailUseCase()) {
        self.bookDetailUseCase = bookDetailUseCase
        self.link = link
        self.fetchData()
    }
    
    func fetchData() {
        
        DispatchQueue.main.async {
            self.viewState = .loading
        }
        
        bookDetailUseCase.execute(link: link) { result in
            
            switch result {
            case .success(let entity):
                DispatchQueue.main.async {
                    self.book = BookDetailModel(entity: entity)
                    self.viewState = .presenting
                }
                
            case .failure(_):
                DispatchQueue.main.async {
                    self.viewState = .error
                }
            }
        }
    }

}
