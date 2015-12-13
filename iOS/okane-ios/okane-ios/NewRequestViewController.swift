//
//  NewRequestViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class NewRequestViewController: UIViewController, TabBarViewController {

    @IBOutlet weak var mainScrollView: UIScrollView!
    
    var tabBarViewController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.alwaysBounceVertical = true
        
        tabBarViewController = self.parentViewController as! UITabBarController
        tabBarViewController.tabBar.hidden = true
    }
    
    func getTabBarViewController() -> UITabBarController {
        return tabBarViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
