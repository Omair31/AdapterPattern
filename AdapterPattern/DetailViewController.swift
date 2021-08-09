//
//  DetailViewController.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import UIKit

class DetailViewController: UIViewController {
    
    var comment: Comment?
    
    @IBOutlet weak var postIdLabel: UILabel!
    
    @IBOutlet weak var idLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        postIdLabel.text = "\(comment?.postId ?? 0)"
        idLabel.text = "\(comment?.id ?? 0)"
        nameLabel.text = comment?.name
        emailLabel.text = comment?.email
        bodyLabel.text = comment?.body
    }
    
}
