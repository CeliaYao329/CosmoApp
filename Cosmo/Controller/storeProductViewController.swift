//
//  storeProductViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class storeProductViewController: UIViewController {

    var focusProduct : Product = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var focusProductImageView: UIImageView!
    @IBOutlet weak var focusProductNameLabel: UILabel!
    @IBOutlet weak var focusProductDescriptionLabel: UILabel!
    @IBOutlet weak var focusProductPriceLabel: UILabel!
    
    var products : [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        products = fetchProducts()
        
        focusProductImageView.image = focusProduct.picture
        focusProductNameLabel.text = focusProduct.productName
        focusProductDescriptionLabel.text = focusProduct.description
        focusProductPriceLabel.text = "\(focusProduct.capacity) oz. $\(focusProduct.price)"
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
        let product1 = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
        let product2 = Product(_productID: "2", _productName: "Free", _picture: "Free-MAC-lipstick", _description: "freeme!!!!!", _capacity: 2, _price: 19.1)
        let product3 = Product(_productID: "3", _productName: "Mediumrare", _picture: "Mediumrare-MAC-lipstick", _description: "medmedmedmsmhgjb", _capacity: 2, _price: 10.2)
        products.append(product1)
        products.append(product2)
        products.append(product3)
        
        return products
    }
}

extension storeProductViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellProduct = products[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as! ProductTableViewCell
        cell.setProductCell(curProduct: cellProduct)//configure the cell
        return cell
    }
}