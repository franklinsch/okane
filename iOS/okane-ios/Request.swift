//
//  Request.swift
//  okane-ios
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Franklin Schrans. All rights reserved.
//

class Request {
    static var counter = 0
    
    var requestid: REQUESTID
    var title: String
    var description: String
    var amountToRaise: Int
    var amountRaised: Int
    var user: USERID;
    var date: Date;
    
    init(title: String, description: String, amountToRaise: Int, amountRaised: Int, user: USERID, date: Date) {
        self.title = title;
        self.description = description;
        self.amountToRaise = amountToRaise;
        self.amountRaised = amountRaised;
        self.user = user;
        self.date = date
        
        self.requestid = generateID();
    }
    
    func generateID() -> REQUESTID {
        return REQUESTID(id: Request.counter++)
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