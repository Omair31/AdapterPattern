//
//  UITableViewCell+Extension.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import UIKit

extension UITableViewCell {
    
    func configure(item: ItemViewModel) {
        textLabel?.text = item.title
        detailTextLabel?.text = item.subtitle
    }
}
