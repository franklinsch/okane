//
//  Request.swift
//  okane-ios
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Franklin Schrans. All rights reserved.
//

class Request {
    var requestid: REQUESTID;
    var title: String
    var description: String
    var amountToRaise: Int
    var amountRaised: Int
    var user: USERID;
    var date: Date;
    
    init(title: String, description: String, amountToRaise: Int, amountRaised: Int, user: USERID) {
        self.title = title;
        self.description = description;
        self.amountToRaise = amountToRaise;
        self.amountRaised = amountRaised;
        self.user = user;
        self.date = date
        
        self.requestid = generateID();
    }
    
    func generateID() -> REQUESTID {
        return 0;
    }
    
    func addInvestmentAmount(investAmount: Int) {
        amountRaised += investAmount
        if (amountRaised >= amountToraise) {
            completeRequest()
        }
    }
    
    func completeRequest() {
        continue
    }
}