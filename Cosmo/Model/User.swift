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
    var userId: String?
    var userName: String?
    var wishingList : [Product] = [Product]()
    var recommendedList: [Product] = [Product]()
    //var reviewList : [Review] = [Review]()
    var longitude: Double?
    var latitude: Double?
    var portrait: String?
    var QRCode: UIImage?
}
