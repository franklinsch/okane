//
//  User.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit
import CoreLocation

struct User {
    var basicUserInfo: BasicUserInfo
    var preferredCurrency: Currency
    var userRating: UserRating
    
    init(basicUserInfo: BasicUserInfo, preferredCurrency: Currency, userRating: UserRating) {
        self.basicUserInfo = basicUserInfo
        self.preferredCurrency = preferredCurrency
        self.userRating = userRating
    }
}

struct BasicUserInfo {
    var name: String
    var age: Int
    var photo: UIImage
    var homeTown: CLLocation
}

struct UserRating {
    var stars: Star
}

enum Star {
    case One
    case Two
    case Three
    case Four
    case Five
}