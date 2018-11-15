//
//  ReviewDisplayTableViewCell.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import UIKit

class ReviewDisplayTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerPortraitView: UIImageView!
    @IBOutlet weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet weak var reviewBodyLabel: UILabel!
    
    func setReviewDisplayCell(curReview: Review){
        reviewerPortraitView.image = UIImage(named: (curReview.reviewer?.portrait)!)
        reviewerNameLabel.text = curReview.reviewer?.userName
        reviewBodyLabel.text = curReview.note
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = DateFormatter.Style.long
        dateformatter.timeStyle = DateFormatter.Style.long
        reviewDateLabel.text = dateformatter.string(from: curReview.timestamp!)
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
