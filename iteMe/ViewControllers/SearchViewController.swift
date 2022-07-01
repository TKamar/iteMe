//
//  SearchViewController.swift
//  iteMe
//
//  Created by user216739 on 6/28/22.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    var imagesSearch: [UIImage]!
    var storesSearch: [String]!
//    var storeItemsSearch: [String] = []
    var filteredData: [String]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "StoresTableViewCell", bundle: nil)
        searchTableView.rowHeight = UITableView.automaticDimension
        searchTableView.estimatedRowHeight = 50
        searchTableView.register(nib, forCellReuseIdentifier: "StoresTableViewCell")
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        filteredData = AllStoresViewController.storesItems
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "StoresTableViewCell", for: indexPath) as! StoresTableViewCell
        cell.storeLBL.text = filteredData[indexPath.row]
        cell.storeIMG.image = imagesSearch[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "searchViewController", sender: self)
    }
    
    
//    func updateSearchResults(for searchController: UISearchController) {
//
//        if searchController.searchBar.text! == "" {
//            filteredData = AllStoresViewController.stores
//        } else {
//            filteredData.removeAll()
//
//            var namesArray = [String]()
//
//            for (_, value) in AllStoresViewController.storesItems {
//                namesArray += value
//            }
//
//            let namesFilteredArray = namesArray.filter { $0.lowercased().contains(searchController.searchBar.text!.lowercased())
//            }
//
//            for word in namesFilteredArray {
//                if word.uppercased().contains(searchController.uppercased())
//                if let letter = filteredName.getName().characters.first {
//                    
//                }
//                    
//            }
//        }
//
//        self.searchTableView.reloadData()
//    }
//    
    
    
    
    
    
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        filteredData = []
//        storesSearch = []
//        imagesSearch = []
//        var index = 0
//        while index < AllStoresViewController.stores.count {
//            for word in AllStoresViewController.storesItems[index] {
//                if word.uppercased().contains(searchText.uppercased()) {
//                    filteredData.append(AllStoresViewController.stores[index])
////                    storesSearch.append(AllStoresViewController.stores[index])
////                    storeItemsSearch.append(AllStoresViewController.storesItems[index])
//                    let imgName = AllStoresViewController.stores[index]
//                    imagesSearch.append(UIImage(named: imgName)!)
//                    break
//                }
//            }
//            index += 1
//        }
//
//
////        for index in AllStoresViewController.stores {
////            for word in AllStoresViewController.storesItems[index] {
////                if word.uppercased().contains(searchText.uppercased()) {
////
////                }
////            }
////
////        }
//    }
    
    
//    // This method updates filteredData based on the text in the Search Box
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        // When there is no text, filteredData is the same as the original data
//        // When user has entered text into the search box
//        // Use the filter method to iterate over all items in the data array
//        // For each item, return true if the item should be included and false if the
//        // item should NOT be included
//        for index in AllStoresViewController.stores {
//            filteredData += searchText.isEmpty ? AllStoresViewController.storesItems[index] : AllStoresViewController.storesItems[index].filter({(dataString: String) -> Bool in
//                // If dataItem matches the searchText, return true to include it
//                return dataString.range(of: searchText, options: .caseInsensitive) != nil
//        })
//
//        }
//
//        searchTableView.reloadData()
//    }


}
