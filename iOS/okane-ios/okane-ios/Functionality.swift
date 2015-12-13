//
//  Functionality.swift
//  Okane
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Saurav Mitra. All rights reserved.
//

import Parse

class Functionality {
    func grow(userid: USERID) {
        
    }
    
    func request(title: String, description: String, amountToRaise: Int, amountRaised: Int, userid: USERID, tags: [String]) {
        let newRequest = PFObject(className: "Request");
        newRequest["title"] = title;
        newRequest["description"] = description;
        newRequest["amountToRaise"] = amountToRaise;
        newRequest["amountRaised"] = amountRaised;
        newRequest["userid"] = userid;
        newRequest["tags"] = tags;
        do {
          try newRequest.save()
        } catch {
            
        }
    }
    
    func invest(amountInvested: Int, userid: USERID, requestid: REQUESTID) {
        let newInvestment = PFObject(className: "Investment");
        newInvestment["amountInvested"] = amountInvested
        newInvestment["userid"] = userid
        newInvestment["requestid"] = requestid
        do {
            try newInvestment.save()
        } catch {
            
        }
    }
    
    func searchWithTags(searchTags: [String]) -> [PFObject] {
        var objects: [PFObject] = []
        do {
            objects = try PFQuery(className: "Request").whereKey("tags", containedIn: searchTags).findObjects()
        } catch {
            
        }
        return objects
    }
    
    func addFriend(userid: USERID, friendid: USERID) {
        let newFriendRelation = PFObject(className: "FriendRelation")
        newFriendRelation["user"] = userid
        newFriendRelation["friend"] = friendid
        newFriendRelation["confirmed"] = false
        do {
            try newFriendRelation.save()
        } catch {
            
        }
    }
    
    func deleteFriend(userid: USERID, friendid: USERID) {
        let users = [userid, friendid]
        do {
            try PFObject.deleteAll(PFQuery(className: "FriendRelation").whereKey("user", containedIn: users).whereKey("friend", containedIn: users).findObjects())
        } catch {
            
        }
    }
    
    func confirmFriend(userid: USERID, friendid: USERID) {
        do {
            try PFQuery(className: "FriendRelation").whereKey("user", equalTo: userid).whereKey("friend", equalTo: friendid).getFirstObject()["confirmed"] = true
        } catch {
            
        }
    }
}