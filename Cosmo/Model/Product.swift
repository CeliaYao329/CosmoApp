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
    var tags : [String] = ["Super moist", "Too expensize", "nice color"]
    var reviews : [Review] = []
    
    
    init(_productID: String, _productName: String, _picture: String, _description: String, _capacity: Int, _price : Float){
        productID = _productID
        productName = _productName
        picture = UIImage(named: _picture)!
        description = _description
        capacity = _capacity
        price = _price
    }
    init(){
        productName = ""
        productID = ""
        picture = UIImage(named: "default")!
        description = ""
        capacity = 0
        price = 0
    }
}
