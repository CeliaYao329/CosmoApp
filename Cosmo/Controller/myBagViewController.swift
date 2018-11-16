//
//  myBagViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class myBagViewController: UIViewController {
    
    @IBOutlet weak var bagProductTableView: UITableView!
    var bagProducts : [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        bagProducts = fetchProducts()
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
    func fetchProducts() -> [Product]{
        var products : [Product] = []
        let product1 = Product(_productID: "product001", _productName: "PIGMENT: ROSE", _picture: "product001pic", _description: "A concentrated loose colour powder", _capacity: 15, _price: 22)
        let product2 = Product(_productID: "product002", _productName: "VERSICOLOUR VARNISH CREAM LIP STAIN", _picture: "product002pic", _description: "A glossy hybrid lip colour", _capacity: 28, _price: 22)
        let product3 = Product(_productID: "product003", _productName: "FACE COMPACT: FAIR / SHINY PRETTY THINGS", _picture: "product003pic", _description: "A face compact. $63.50 value", _capacity: 49, _price: 39.5)
        let product4 = Product(_productID: "product004", _productName: "MISCHIEF MINX PALETTE: WARM NEUTRAL", _picture: "product004pic", _description: "A palette of Eye Shadows and Highlighter", _capacity: 60, _price: 41)
        let product5 = Product(_productID: "product005", _productName: "MINERALIZE BLUSH: WARM SOUL", _picture: "product005pic", _description: "A blush without heavy coverage.", _capacity: 12, _price: 29)
        let product6 = Product(_productID: "product006", _productName: "EXTENDED PLAY GIGABLACK LASH MASCARA", _picture: "product006pic", _description: "A smudge-proof carbon black formula", _capacity: 19, _price: 19)
        let product7 = Product(_productID: "product007", _productName: "STUDIO FIX POWDER PLUS FOUNDATION", _picture: "product007pic", _description: "A one-step powder and foundation", _capacity: 52, _price: 30)
        let product8 = Product(_productID: "product008", _productName: "MINERALIZE BLUSH: WARM SOUL", _picture: "product008pic", _description: "A lightweight water mist", _capacity: 12, _price: 29)
        let product9 = Product(_productID: "product009", _productName: "EXTENDED PLAY GIGABLACK LASH MASCARA", _picture: "product009pic", _description: "A liquid-powder highlighter", _capacity: 19, _price: 19)
        
        
        
        products.append(product1)
        products.append(product2)
        products.append(product3)
        products.append(product4)
        products.append(product5)
        products.append(product6)
        products.append(product7)
        products.append(product8)
        products.append(product9)
        
        return products
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
