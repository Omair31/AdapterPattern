//
//  CommentsAPIAdapter.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import Foundation

class CommentsAPIAdapter: ItemsService {
    
    let urlString: String
    let api: CommentsAPI
    let select: (Comment) -> Void
    
    init(urlString:String, api: CommentsAPI, select: @escaping (Comment) -> Void) {
        self.urlString = urlString
        self.api = api
        self.select = select
    }
    
    func loadItems(completion: @escaping (Result<[ItemViewModel], Error>) -> Void) {
        api.fetchData(urlString: urlString) { (result) in
            switch result {
            case .success(let comments):
                completion(.success(comments.map({ comment in
                    return ItemViewModel(comment: comment) {
                        self.select(comment)
                    }
                })))
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
