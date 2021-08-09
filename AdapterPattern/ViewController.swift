//
//  ViewController.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let listVC = self.storyboard?.instantiateViewController(identifier: "ListViewController") as! ListViewController
        listVC.service = CommentsAPIAdapter(urlString: "https://jsonplaceholder.typicode.com/comments", api: CommentsAPI.shared, select: { [weak listVC] comment in
            listVC?.selectItem(item: comment)
        })
        self.show(listVC, sender: self)
    }
    
}

