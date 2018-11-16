//
//  productHorizontalCollectionViewCell.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class productHorizontalCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    func setProductHorizontalCell(curProduct: Product){
        productImage.image = curProduct.picture
        productNameLabel.text = curProduct.productName
        productDescriptionLabel.text = curProduct.description
        productPriceLabel.text = "\(curProduct.capacity) oz. $\(curProduct.price)"
        
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.8
        self.layer.shadowOffset = CGSize(width: 4.0, height: 2.0)
        self.layer.shadowRadius = 8.0 / 2
        self.clipsToBounds = false
    }
    
}
