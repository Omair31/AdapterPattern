//
//  ItemsService.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import Foundation

protocol ItemsService {
    func loadItems(completion: @escaping (Result<[ItemViewModel], Error>) -> Void)
}
