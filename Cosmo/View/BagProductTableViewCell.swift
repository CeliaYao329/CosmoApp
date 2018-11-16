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
        
        //shadow
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.4
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        self.layer.shadowRadius = 10.0 / 2
        self.clipsToBounds = false
    }
    
    override var frame: CGRect {
        get {
            return super.frame
        }
        set (newFrame) {
            var frame =  newFrame
            frame.origin.y += 5
            frame.size.height -= 2 * 5
            frame.origin.x += 8
            frame.size.width -= 2 * 8
            
            super.frame = frame
        }
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
