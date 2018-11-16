//
//  fillReviewViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/15/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit
import Cosmos
import TagListView
class fillReviewViewController: UIViewController, TagListViewDelegate {
    
    var reviewProduct : Product = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
    
    @IBOutlet weak var fillReviewProductImage: UIImageView!
    @IBOutlet weak var fillReviewProductName: UILabel!
    @IBOutlet weak var fillReviewProductPrice: UILabel!
    @IBOutlet weak var fillReviewProductDescription: UILabel!
    
    //rate stars
    @IBOutlet weak var rateSubview: UIView!

    @IBOutlet weak var tagList: TagListView!
    
    lazy var rateView: CosmosView = {
        var view = CosmosView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        rateSubview.addSubview(rateView)
        tagList.delegate = self
        
        fillReviewProductImage.image = reviewProduct.picture
        fillReviewProductName.text = reviewProduct.productName
        fillReviewProductDescription.text = reviewProduct.description
        fillReviewProductPrice.text = "\(reviewProduct.capacity) oz. $\(reviewProduct.price)"
        
        // Do any additional setup after loading the view.
        configureTags()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func configureTags(){
        tagList.textFont = UIFont.systemFont(ofSize: 24)
        tagList.alignment = .center // possible values are .Left, .Center, and .Right
        
        tagList.addTags(["Bold", "True", "Sheer","Shine", "Satin", "Matte","Dry","Creamy","Oily"])
                
        tagList.setTitle("New Title", at:6) // to replace the title a tag
    }
}
