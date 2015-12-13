//
//  Request.swift
//  okane-ios
//
//  Created by Franklin Schrans on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class Request {
    static var counter = 0
    
//    var requestid: REQUESTID
    var title: String
    var description: String
    var amountToRaise: Int
    var amountRaised: Int
    var user: USERID;
    var date: NSDate;
    var interestRate: Float
    var image: UIImage!
    
    init(title: String, description: String, amountToRaise: Int, amountRaised: Int, user: USERID, date: NSDate, image: UIImage, interestRate: Float) {
        self.title = title;
        self.description = description;
        self.amountToRaise = amountToRaise;
        self.amountRaised = amountRaised;
        self.user = user;
        self.date = date
        self.interestRate = interestRate
        self.image = image
        
//        self.requestid = generateID();
    }
    
    func generateID() -> REQUESTID {
        Request.counter = Request.counter + 1
        return REQUESTID(id: "\(Request.counter - 1)")
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