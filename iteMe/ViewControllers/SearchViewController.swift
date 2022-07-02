
import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating {

    
        @IBOutlet weak var searchTableView: UITableView!
    var imagesSearch: [UIImage]!
    var storesSearch: [String]!
    var filteredData = [ItemsData]()
    var searching = false
    let searchController = UISearchController(searchResultsController: nil)
    
    var listItems = [ItemsData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let item1 = ItemsData(sName: "Walmart", sItem: ["Walmart1", "Walmart2"])
        listItems .append(item1)
        let item2 = ItemsData(sName: "nike", sItem: ["Nike1", "Nike2", "Nike3"])
        listItems.append(item2)
        let item3 = ItemsData(sName: "officeDepot", sItem: [])
        listItems.append(item3)
        
        initSearchTableView()
        initSearchController()
        
    }
    
    func initSearchTableView() {
        let nib = UINib(nibName: "StoresTableViewCell", bundle: nil)
        searchTableView.rowHeight = UITableView.automaticDimension
        searchTableView.estimatedRowHeight = 50
        searchTableView.register(nib, forCellReuseIdentifier: "StoresTableViewCell")
        searchTableView.delegate = self
        searchTableView.dataSource = self
    }
    
    func initSearchController() {
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Item"
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            filteredData.removeAll()
            for store in listItems {
                for item in store.storeItems ?? [] {
                    if item.lowercased().contains(searchText.lowercased()){
                        filteredData.append(store)
                        break
                    }
                }
            }
            
        }
        else{
            searching = false
            filteredData.removeAll()
            filteredData = listItems
        }
        searchTableView.reloadData()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        filteredData.removeAll()
        searchTableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searching) {
            return filteredData.count
        }
        else {
            return AllStoresViewController.stores.count

        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchTableView.dequeueReusableCell(withIdentifier: "StoresTableViewCell", for: indexPath) as! StoresTableViewCell
        
        if(searching){
            cell.storeLBL.text = filteredData[indexPath.row].storeName
            cell.storeIMG.image = UIImage(named: filteredData[indexPath.row].storeName)
            
        }
        else {
            cell.storeLBL.text = AllStoresViewController.stores[indexPath.row]
            cell.storeIMG.image = UIImage(named: AllStoresViewController.stores[indexPath.row])
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchTableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "searchViewController", sender: self)
    }
    
 

}
