//
//  myBagViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit
import Firebase
class myBagViewController: UIViewController {
    
    @IBOutlet weak var bagProductTableView: UITableView!
    var bagProducts : [Product] = []
    var db : Firestore!
    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        fetchProducts()
        // Do any additional setup after loading the view.
        bagProductTableView.delegate = self
        bagProductTableView.dataSource = self
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchProducts() {
        db.collection("products").getDocuments { (snapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in snapshot!.documents {
                    let productID = document.data()["product_id"] as! String
                    let productName = document.data()["product_name"] as! String
                    let picture = productID + "pic"
                    let capacity = (document.data()["capacity"] as! NSNumber).intValue
                    let price = (document.data()["capacity"] as! NSNumber).floatValue
                    let description = document.data()["description"] as! String
                    print("receive product: \(productID), \(productName), \(picture)")
                    let product = Product(_productID: productID, _productName: productName, _picture: picture, _description: description, _capacity: capacity, _price: price)
                    self.bagProducts.append(product)
                    self.bagProductTableView?.reloadData()
                }
            }
        }
        
        
    }

}

extension myBagViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bagProducts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProduct = bagProducts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagProductCell") as! BagProductTableViewCell
        cell.setProductCell(curProduct: cellProduct)//configure the cell
        return cell
    }
}
