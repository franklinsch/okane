//
//  Functionality.swift
//  Okane
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Saurav Mitra. All rights reserved.
//

class Functionality {
    func grow(userid: USERID) {
        
    }
    
    func request(userid: USERID, requestid: Request) {
        
    }
    
    func invest(userid: USERID, investid: INVESTID) {
        
    }
    
    func searchWithTags(searchTags: [String]) -> [Reqeust] {
        objects = PFQuery(className:”Request”).whereKey(“tags”, containedIn: searchTags).getObjects()
        return [] // NOT complete
    }
}