//
//  tagCollectionViewCell.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class tagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    func setUpProperties() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 2.0
        self.layer.cornerRadius = 0
    }
}
