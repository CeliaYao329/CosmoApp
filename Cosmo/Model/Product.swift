//
//  Product.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import Foundation
import UIKit

class Product{
    var productName: String
    var productID: String
    var picture: UIImage
    var description: String
    var capacity: Int
    var price: Float
    
    init(_productID: String, _productName: String, _picture: String, _description: String, _capacity: Int, _price : Float){
        productID = _productID
        productName = _productName
        picture = UIImage(named: _picture)!
        description = _description
        capacity = _capacity
        price = _price
    }
}
