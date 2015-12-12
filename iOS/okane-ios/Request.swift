//
//  Request.swift
//  okane-ios
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class Request {
    var requestid: REQUESTID
    var title: String
    var description: String
    var amountToRaise: Int
    var amountRaised: Int
    var user: USERID
    var date: Date
    var image: UIImage?
    var interestRate: Int
    
    init(title: String, description: String, amountToRaise: Int, amountRaised: Int, user: USERID, date: Date, image: UIImage?, interestRate: Int) {
        self.title = title;
        self.description = description;
        self.amountToRaise = amountToRaise;
        self.amountRaised = amountRaised;
        self.user = user;
        self.date = date
        self.image = image
        self.interestRate = interestRate
        
        self.requestid = REQUESTID()
//        self.requestid = generateID()!
    }
    
    func generateID() -> REQUESTID? {
        return nil;
    }
    
    func addInvestmentAmount(investAmount: Int) {
        amountRaised += investAmount
        if (amountRaised >= amountToRaise) {
            completeRequest()
        }
    }
    
    func completeRequest() {
        return
    }
}