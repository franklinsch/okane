//
//  ViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 11/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let permissions = ["public_profile"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func fbLoginClick(sender: AnyObject) {
        PFFacebookUtils.logInWithPermissions(self.permissions, block: {
            (user: PFUser?, error: NSError?) -> Void in
            if user == nil {
                NSLog("Uh oh. The user cancelled the Facebook login.")
            } else if user!.isNew {
                NSLog("User signed up and logged in through Facebook!")
            } else {
                NSLog("User logged in through Facebook! \(user!.username)")
            }
        })
    }
}

