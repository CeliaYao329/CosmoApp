//
//  productDetailViewController.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class productDetailViewController: UIViewController {
    var displayProduct : Product = Product(_productID: "1", _productName: "CHILI", _picture: "CHILI-MAC-lipstick", _description: "chilichilichili", _capacity: 2, _price: 12.2)
    
    var tags : [String]  = []
    
    var reviews : [Review] = [] //TODO - create reviews
    
    @IBOutlet weak var displayProductView: UIImageView!
    
    @IBOutlet weak var displayProductNameLabel: UILabel!
    
    @IBOutlet weak var displayProductDescriptionLabel: UILabel!
    
    @IBOutlet weak var displayProductPriceLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createReviewsAndTags()
        
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.delegate = self
        tableView.dataSource = self
        
        
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
        fakereview.note = "So, let's make a playground, because playgrounds are fun to work with and they hang almost every 2nd time of running your code on the mac."
        fakereview.product = displayProduct
        fakereview.rate = 4.9
        fakereview.reviewer = User() //TODO -
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
        let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectioncell", for: indexPath) as! tagCollectionViewCell
        tagCell.tagLabel.text = tags[indexPath.row]
        return tagCell
    }
    
   
}
