//
//  StoreViewController.swift
//  iteMe
//
//  Created by user216739 on 7/1/22.
//

import UIKit

class StoreViewController: UIViewController {

    @IBOutlet weak var storeIMG: UIImageView!
    @IBOutlet weak var storeText: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        storeIMG.image = AllStoresViewController.images[AllStoresViewController.myIndex]
        storeText.text = getItems(store: AllStoresViewController.storesItems[AllStoresViewController.myIndex])
        
    }
    
    
    func getItems(store: [String]) -> String {
        var str = ""
        for item in store {
            str += item + "\n"
        }
        return str
    }


}
