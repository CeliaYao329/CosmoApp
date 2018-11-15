//
//  Reiview.swift
//  Cosmo
//
//  Created by Siyu Yao on 11/14/18.
//  Copyright © 2018 Siyu Yao. All rights reserved.
//

import Foundation

class Review{
    var reviewer: User?
    var product: Product?
    var rate: Float?
    var tags: [String] = []
    var note: String?
    var timestamp: Date?
}
