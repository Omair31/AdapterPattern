//
//  ListViewController.swift
//  AdapterPattern
//
//  Created by VenD-Omeir on 09/08/2021.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [ItemViewModel]()
    
    var service: ItemsService?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service?.loadItems(completion: { result in
            switch result {
            case .success(let items):
                self.items = items
                self.tableView.reloadData()
                
            case .failure(let error):
                print(error)
            }
        })
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let item = items[indexPath.row]
        cell.configure(item: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.select()
    }
    
}


extension UIViewController {
    
    func selectItem(item: Comment) {
        let vc = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as! DetailViewController
        vc.comment = item
        self.show(vc, sender: self)
    }
    
}


