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
    
    func searchWithTags(searchTags: [String]) -> [Request] {
//        do {
//            let objects = try PFQuery(className: "Request").whereKey("tags", containedIn: searchTags).findObjects()
//        } catch {
//            
//        }
        return [] // NOT complete
    }
    
    func addFriend(userid: USERID, friendid: USERID) {
        
    }
    
    func deleteFriend(userid: USERID, friendid: USERID) {
        
    }
    
    func confirmFriend(userid: USERID, friendid: USERID) {
        
    }
}