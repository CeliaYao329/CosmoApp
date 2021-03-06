//
//  User.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import Foundation
import UIKit

class User{
    var userId: String = "fakeuserid"
    var userName: String = "fakeusername"
    var wishingList : [Product] = [Product]()
    var recommendedList: [Product] = [Product]()
    //var reviewList : [Review] = [Review]()
    var longitude: Double = -73.978570
    var latitude: Double = 40.756670
    var portrait: String = "Portrait"
    var QRCode: UIImage = UIImage(named:"QRCode")!
    
    init(_userId: String, _userName: String, _wishingList: [Product], _recommendedList: [Product], _longtitude: Double, _latitude: Double, _portrait: String) {
        userId = _userId
        userName = _userName
        wishingList = _wishingList
        recommendedList = _recommendedList
        longitude = _longtitude
        latitude = _latitude
        portrait = _portrait
        
    }
}
