//
//  Comment.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import Foundation

struct Comment: Decodable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
