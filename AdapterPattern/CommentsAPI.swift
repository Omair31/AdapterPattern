//
//  CommentsAPI.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import Foundation

class CommentsAPI {
    
    static let shared = CommentsAPI()
    
    func fetchData(urlString: String, completion: @escaping (Result<[Comment], Error>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(NetworkError.badURL))
            return
        }
        
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringCacheData
        let session = URLSession(configuration: config)
        session.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                if error != nil {
                    completion(.failure(NetworkError.general))
                    return
                }
                
                let decoder = JSONDecoder()
                do {
                    let comments = try decoder.decode([Comment].self, from: data!)
                    completion(.success(comments))
                } catch let error {
                    print(error)
                    completion(.failure(NetworkError.general))
                }
            }
            
            
        }.resume()
        
    }
    
}
