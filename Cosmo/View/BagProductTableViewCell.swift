//
//  BagProductTableViewCell.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class BagProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bagProductImage: UIImageView!
    @IBOutlet weak var bagProductName: UILabel!
    @IBOutlet weak var bagProductDescription: UILabel!
    @IBOutlet weak var bagProductPrice: UILabel!
    
    func setProductCell(curProduct: Product){
        bagProductImage.image = curProduct.picture
        bagProductName.text = curProduct.productName
        bagProductDescription.text = curProduct.description
        bagProductPrice.text = "\(curProduct.capacity) oz. $\(curProduct.price)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
