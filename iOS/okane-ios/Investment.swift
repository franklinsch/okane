//
//  Investment.swift
//  okane-ios
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Franklin Schrans. All rights reserved.
//

class Investment {
    static var counter = 0
    
    var investid: INVESTID
    var requestid: REQUESTID
    var userid: USERID
    var amountInvested: Int
    var date: Date
    
    init(requestid: REQUESTID, userid: USERID, amountInvested: Int, date: Date) {
        self.requestid = requestid
        self.userid = userid
        self.amountInvested = amountInvested
        self.date = date
        
        self.investid = generateID()
    }
    
    func generateID() -> INVESTID {
        return INVESTID(id: Investment.counter++)
    }
}