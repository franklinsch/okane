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
    class func signUpUser(username: String, password: String, email: String) -> PFUser {
        let newUser = PFUser()
        newUser.username = username
        newUser.password = password
        newUser.email = email
        do {
            try newUser.signUp()
        } catch {}
        return newUser
    }
    class func grow(userid: USERID) {
        do {
            let objects = try PFQuery(className: "Request").orderByAscending("creditScore").orderByAscending("interestRate").findObjects()
        } catch {}
        return
    }
    
    class func request(title: String, description: String, amountToRaise: Int, amountRaised: Int, userid: USERID?, interestRate: Int, returnBy: NSDate, tags: [String] = []) -> REQUESTID {
        PFUser.registerSubclass()
        let newRequest = PFObject(className: "Request");
        newRequest["title"] = title;
        newRequest["description"] = description;
        newRequest["amountToRaise"] = amountToRaise;
        newRequest["amountRaised"] = amountRaised;
        if let uid = userid {
            do {
                let u = try PFQuery(className: "_User").getObjectWithId(uid.id)
                newRequest["userid"] = u;
            } catch {}
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
            newRequest.addObjectsFromArray(generateTags(title, description: description, amountToRaise: amountToRaise, amountRaised: amountRaised, userid: userid, interestRate: interestRate, returnBy: returnBy), forKey: "tags")
        } else {
            newRequest.addObjectsFromArray(tags, forKey: "tags");
        }
        do {
            newRequest["image"] = try PFFile(name: "", contentsAtPath: "")
        } catch {}
        print(newRequest)
        do {
            try newRequest.save()
        } catch {
            print ("Error")
        }
        //return REQUESTID(id: newRequest.objectId!)
        return REQUESTID(id: "placeholder")
    }
    
    class func generateTags(title: String, description: String, amountToRaise: Int, amountRaised: Int, userid: USERID?, interestRate: Int, returnBy: NSDate) -> [String] {
        return []
    }
    
    class func invest(amountInvested: Int, userid: USERID, requestid: REQUESTID) -> INVESTID {
        let newInvestment = PFObject(className: "Investment");
        newInvestment["amountInvested"] = amountInvested
        do {
            newInvestment["userID"] = try PFQuery(className: "_User").getObjectWithId(userid.id)
        } catch {}
        do {
            let request = try PFQuery(className: "Request").getObjectWithId(requestid.id)
            newInvestment["requestid"] = request
            let amountRaised = (request["amountRaised"] as! Int) + amountInvested
            
            request["amountRaised"] = amountRaised
            if (amountRaised > request["amountToRaise"] as! Int) {
                completeRequest(request)
            }
            try request.save()
        } catch {}
        
        do {
            try newInvestment.save()
        } catch {
            
        }
        //return INVESTID(id: newInvestment.objectId!)
        return INVESTID(id: "placeholder")
    }
    
    class func completeRequest(request: PFObject) {
        
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