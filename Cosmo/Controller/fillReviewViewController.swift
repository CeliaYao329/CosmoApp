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
class fillReviewViewController: UIViewController, TagListViewDelegate, UITextFieldDelegate {
    
    var reviewProduct : Product = Product(_productID: "product001", _productName: "PIGMENT: ROSE", _picture: "product001pic", _description: "A concentrated loose colour powder", _capacity: 15, _price: 22)
    
    @IBOutlet weak var fillReviewProductImage: UIImageView!
    @IBOutlet weak var fillReviewProductName: UILabel!
    @IBOutlet weak var fillReviewProductPrice: UILabel!
    @IBOutlet weak var fillReviewProductDescription: UILabel!
    
    //rate stars
    @IBOutlet weak var rateSubview: UIView!

    @IBOutlet weak var tagList: TagListView!
    @IBOutlet weak var tagList2: TagListView!
    @IBOutlet weak var tagList3: TagListView!
    @IBOutlet weak var paragraphTextField: UITextField!
    
    lazy var rateView: CosmosView = {
        var view = CosmosView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        rateSubview.addSubview(rateView)
        tagList.delegate = self
        tagList2.delegate = self
        tagList3.delegate = self
        paragraphTextField.delegate = self
        
        //listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        
        fillReviewProductImage.image = reviewProduct.picture
        fillReviewProductName.text = reviewProduct.productName
        fillReviewProductDescription.text = reviewProduct.description
        fillReviewProductPrice.text = "\(reviewProduct.capacity) oz. $\(reviewProduct.price)"
        
        // Do any additional setup after loading the view.
        configureTags()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
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
        tagList.textFont = UIFont.systemFont(ofSize: 10)
        tagList.alignment = .center
        tagList2.textFont = UIFont.systemFont(ofSize: 10)
        tagList2.alignment = .center
        tagList3.textFont = UIFont.systemFont(ofSize: 10)
        tagList3.alignment = .center
        
        
        tagList.addTags(["      Bold               ", "         True            ", "          Sheer          "])
        tagList2.addTags(["      Shine              ", "         Satin           ", "          Matte          "])
        tagList3.addTags(["        Dry              ", "         Creamy          ", "          Oily           "])
        
        
    }
    
    @objc func keyboardWillChange(notification: Notification){
        print("keyboard will show: \(notification.name.rawValue)")
        view.frame.origin.y = -250
    }

    //UITextFieldDelegate Methods that we need to implement
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        paragraphTextField.resignFirstResponder()
        view.frame.origin.y = 0
        return true
    }
    
    
    @IBAction func reviewSubmitPressed(_ sender: UIButton) {
        let congratsController = UIAlertController(title: "Your present is waiting", message: "Thanks for your review", preferredStyle: .alert)
        congratsController.addAction(UIAlertAction(title: "Back", style: .default, handler: { (action) in
            self.performSegue(withIdentifier: "formReivewToHomeView", sender: nil)
        }))
        self.present(congratsController, animated: true, completion: nil)
        //performSegue(withIdentifier: "formReivewToHomeView", sender: nil)
    }

    
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        tagView.isSelected = true
    }
}

