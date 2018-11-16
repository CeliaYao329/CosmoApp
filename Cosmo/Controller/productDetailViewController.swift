//
//  productDetailViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class productDetailViewController: UIViewController {
    var displayProduct : Product = Product(_productID: "product001", _productName: "PIGMENT: ROSE", _picture: "product001pic", _description: "A concentrated loose colour powder", _capacity: 15, _price: 22)
    
    var tags : [String]  = []
    
    var reviews : [Review] = [] //TODO - create reviews
    
    @IBOutlet weak var displayProductView: UIImageView!
    
    @IBOutlet weak var displayProductNameLabel: UILabel!
    
    @IBOutlet weak var displayProductDescriptionLabel: UILabel!
    
    @IBOutlet weak var displayProductPriceLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var goTestButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReviewsAndTags()
        
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        goTestButton.layer.cornerRadius = 6.0
        
        displayProductView.image = displayProduct.picture
        displayProductNameLabel.text = displayProduct.productName
        displayProductDescriptionLabel.text = displayProduct.description
        displayProductPriceLabel.text = "\(displayProduct.capacity) oz. $\(displayProduct.price)"
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func createReviewsAndTags(){
        tags = displayProduct.tags
        let fakereview = Review()
        fakereview.note = "What I love about the pigments is that they can be used for absolutely ANYTHING. You can mic them with other products or use them on their own for intense, bold colour. I use the Vanilla pigment to highlight the inner corners of my eyes and the brow bone. It's a very nice ivory shimmer. Just be careful as a tiny dab on the brush will go a long way. The colour intensity is nothing like I've every experienced!"
        fakereview.product = displayProduct
        fakereview.rate = 5
        
        //wishinglist is fake one
        fakereview.reviewer = User(_userId: "user004", _userName: "tiayoon", _wishingList: [displayProduct], _recommendedList: [displayProduct], _longtitude: 40.702072, _latitude: -73.984126, _portrait: "user004pic") //TODO -
        fakereview.timestamp = NSDate() as Date
        reviews.append(fakereview)
    }
    
}

extension productDetailViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("product detail review table view numberOfRowsInSection called, reviews count: \(reviews.count)")
        return reviews.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let review = reviews[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewDisplayCell") as! ReviewDisplayTableViewCell
        cell.setReviewDisplayCell(curReview: review)
        return cell
    }
}

extension productDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //collection layout
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        
        layout.sectionInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 5)
        layout.itemSize = CGSize(width: width / 3 - 20, height: width / 10)
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 5
        collectionView.collectionViewLayout = layout
        
        //cell layout
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectioncell", for: indexPath) as! tagCollectionViewCell
        tagCell.tagLabel.text = tags[indexPath.row]
        tagCell.setUpProperties()
        return tagCell
    }
    
   
}
