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
    @IBOutlet weak var submitView: UIView!
    
    var tabBarViewController: UITabBarController!
    
    @IBOutlet weak var dateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.alwaysBounceVertical = true
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(tabBar)
        
        tabBarViewController = self.parentViewController as! UITabBarController
        tabBarViewController.tabBar.hidden = true
        
        view.layer.contents = UIImage(named: "background.png")!.CGImage
        
        submitView.backgroundColor = Colors.darkBlue
        submitView.layer.cornerRadius = 5.0
        submitView.alpha = 0.75
        
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
