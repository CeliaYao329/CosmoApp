//
//  fillReviewViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit
import Cosmos

class fillReviewViewController: UIViewController {
    
    
    @IBOutlet weak var fillReviewProductImage: UIImageView!
    @IBOutlet weak var fillReviewProductName: UILabel!
    @IBOutlet weak var fillReviewProductPrice: UILabel!
    @IBOutlet weak var fillReviewProductDescription: UILabel!
    
    //rate stars
    @IBOutlet weak var rateSubview: UIView!
    
    @IBOutlet weak var fillTagCollectionView: UICollectionView!
    
    lazy var rateView: CosmosView = {
        var view = CosmosView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        rateSubview.addSubview(rateView)
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
