//
//  ItemViewModel.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import Foundation

struct ItemViewModel {

    var title: String
    var subtitle: String
    var select: () -> Void
    
    init(comment: Comment, select: @escaping () -> Void) {
        self.title = comment.name
        self.subtitle = comment.body
        self.select = select
    }
}
