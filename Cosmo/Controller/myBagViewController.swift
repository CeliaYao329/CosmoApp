//
//  myBagViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class myBagViewController: UIViewController {
    
    @IBOutlet weak var bagProductTableView: UITableView!
    var bagProducts : [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        bagProducts = fetchProducts()
        
        
        // Do any additional setup after loading the view.
        bagProductTableView.delegate = self
        bagProductTableView.dataSource = self
        self.bagProductTableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func fetchProducts() -> [Product]{
        var products : [Product] = []
        
        /*let product1 = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
        let product2 = Product(_productID: "2", _productName: "Free", _picture: "Free-MAC-lipstick", _description: "freeme!!!!!", _capacity: 2, _price: 19.1)
        let product3 = Product(_productID: "3", _productName: "Mediumrare", _picture: "Mediumrare-MAC-lipstick", _description: "medmedmedmsmhgjb", _capacity: 2, _price: 10.2)
        products.append(product1)
        products.append(product2)
        products.append(product3)*/

        let db = Firestore.firestore()
        
        db.collection("products").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let productID = document.data()["product_id"] as! String
                    let productName = document.data()["product_name"] as! String
                    let picture = productID + "pic"
                    let capacity = (document.data()["capacity"] as! NSNumber).intValue
                    let price = (document.data()["capacity"] as! NSNumber).floatValue
                    let description = document.data()["description"] as! String
                    print("receive product: \(productID), \(productName), \(picture)")
                    let product = Product(_productID: productID, _productName: productName, _picture: picture, _description: description, _capacity: capacity, _price: price)
                    products.append(product)
                }
            }
        }
        print("finish receiving products: \(products.count)" )
        bagProducts = products

        self.bagProductTableView.reloadData()
        return products
    }
}

extension myBagViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("bag products count: \(bagProducts.count)")
        return bagProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProduct = bagProducts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagProductCell") as! BagProductTableViewCell
        cell.setProductCell(curProduct: cellProduct)//configure the cell
        return cell
    }
}
