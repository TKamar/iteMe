
import UIKit

class AllStoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var storesView: UITableView!
    static var myIndex = 0
    static var stores = ["Walmart", "nike", "officeDepot", "colombia"]
    static var images = [UIImage(named: "Walmart"),UIImage(named: "nike"),UIImage(named: "officeDepot"),UIImage(named: "colombia")]
    static var storesItems = [["Walmart1", "Walmart2"], ["Nike1", "Nike2", "Nike3"], [], []]

    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let nib = UINib(nibName: "StoresTableViewCell", bundle: nil)
        storesView.rowHeight = UITableView.automaticDimension
        storesView.estimatedRowHeight = 50
        storesView.register(nib, forCellReuseIdentifier: "StoresTableViewCell")
        storesView.delegate = self
        storesView.dataSource = self
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AllStoresViewController.stores.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storesView.dequeueReusableCell(withIdentifier: "StoresTableViewCell", for: indexPath) as! StoresTableViewCell
        cell.storeLBL.text = AllStoresViewController.stores[indexPath.row]
        cell.storeIMG.image = AllStoresViewController.images[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        AllStoresViewController.myIndex = indexPath.row
        storesView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "allStoresViewController", sender: self)
    }
    
}
