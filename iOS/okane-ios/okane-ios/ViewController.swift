//
//  ViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func fbLoginClick(sender: AnyObject) {
        //PFFacebookUtils.logInWithPermissions(self.permissions, block: {
        //    (user: PFUser?, error: NSError?) -> Void in
        //    if user == nil {
        //        NSLog("Uh oh. The user cancelled the Facebook login.")
        //    } else if user!.isNew {
        //        NSLog("User signed up and logged in through Facebook!")
        //    } else {
        //        NSLog("User logged in through Facebook! \(user!.username)")
        //    }
        //})
    }
}

