
import UIKit

class AllStoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet weak var storesView: UITableView!
    
    let stores = ["Walmart", "nike", "officeDepot", "colombia"]
    let images = [UIImage(named: "Walmart"),UIImage(named: "nike"),UIImage(named: "officeDepot"),UIImage(named: "colombia")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "StoresTableViewCell", bundle: nil)
        storesView.rowHeight = UITableView.automaticDimension
        storesView.estimatedRowHeight = 50
        storesView.register(nib, forCellReuseIdentifier: "StoresTableViewCell")
        storesView.delegate = self
        storesView.dataSource = self
        // Do any additional setup after loading the view.
    }



    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = storesView.dequeueReusableCell(withIdentifier: "StoresTableViewCell", for: indexPath) as! StoresTableViewCell
        cell.storeLBL.text = stores[indexPath.row]
        cell.storeIMG.image = images[indexPath.row]
        return cell
    }
    
}
