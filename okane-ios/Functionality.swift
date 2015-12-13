//
//  Functionality.swift
//  Okane
//
//  Created by Saurav Mitra on 12/12/2015.
//  Copyright (c) 2015 Saurav Mitra. All rights reserved.
//

import Parse
import UIKit

class Functionality {
    class func grow(userid: USERID) {
        
    }
    
    class func request(title: String, description: String, amountToRaise: Int, amountRaised: Int, userid: USERID?, interestRate: Int, returnBy: NSDate, tags: [String] = []) -> REQUESTID {
        PFUser.registerSubclass()
        let newRequest = PFObject(className: "Request");
        newRequest["title"] = title;
        newRequest["description"] = description;
        newRequest["amountToRaise"] = amountToRaise;
        newRequest["amountRaised"] = amountRaised;
        if let uid = userid {
            newRequest["userid"] = uid;
        } else {
            let user = PFUser()
            user.username = "hello"
            user.password = "bello"
            user.email = "cray@cray.com"
            do {
                try user.signUp()
                print ("success")
            } catch {
                print ("error")
            }
            print (user.objectId)
            newRequest["userid"] = user.objectId!
        }
        newRequest["interestRate"] = interestRate;
        newRequest["returnBy"] = returnBy;
        if (tags == []) {
            newRequest["tags"] = generateTags(title, description: description, amountToRaise: amountToRaise, amountRaised: amountRaised, userid: userid, interestRate: interestRate, returnBy: returnBy)
        } else {
            newRequest["tags"] = tags;
        }
        newRequest["image"] = "bleh"
        do {
          try newRequest.save()
        } catch {
            
        }
        return REQUESTID(id: newRequest.objectId!)
    }
    
    class func generateTags(title: String, description: String, amountToRaise: Int, amountRaised: Int, userid: USERID?, interestRate: Int, returnBy: NSDate) -> [String] {
        return []
    }
    
    
    class func invest(amountInvested: Int, userid: USERID, requestid: REQUESTID) -> INVESTID {
        let newInvestment = PFObject(className: "Investment");
        newInvestment["amountInvested"] = amountInvested
        newInvestment["userid"] = userid
        newInvestment["requestid"] = requestid
        do {
            try newInvestment.save()
        } catch {
            
        }
        return INVESTID(id: newInvestment.objectId!)
    }
    
    class func searchWithTags(searchTags: [String]) -> [PFObject] {
        var objects: [PFObject] = []
        do {
            objects = try PFQuery(className: "Request").whereKey("tags", containedIn: searchTags).findObjects()
        } catch {
            
        }
        return objects
    }
    
    class func addFriend(userid: USERID, friendid: USERID) {
        let newFriendRelation = PFObject(className: "FriendRelation")
        newFriendRelation["user"] = userid
        newFriendRelation["friend"] = friendid
        newFriendRelation["confirmed"] = false
        do {
            try newFriendRelation.save()
        } catch {
            
        }
    }
    
    class func deleteFriend(userid: USERID, friendid: USERID) {
        let users = [userid, friendid]
        do {
            try PFObject.deleteAll(PFQuery(className: "FriendRelation").whereKey("user", containedIn: users).whereKey("friend", containedIn: users).findObjects())
        } catch {
            
        }
    }
    
    class func confirmFriend(userid: USERID, friendid: USERID) {
        do {
            try PFQuery(className: "FriendRelation").whereKey("user", equalTo: userid).whereKey("friend", equalTo: friendid).getFirstObject()["confirmed"] = true
        } catch {
            
        }
    }
}