//
//  MyAccountViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class MyAccountViewController: UIViewController, TabBarViewController {
    var profileImage: UIImage!
    var profileName: UILabel!
    var accountSettingsButton: UIButton!
    var statsButton: UIButton!
    var collectMoneyButton: UIButton!
    var moneyDisplayLabel: UILabel!
    var investmentDisplayLabel: UILabel!
    var investmentsBox: UIView!
    var storiesDisplaylabel: UILabel!
    var storiesBox: UIView!
    var tutorialButton: UIButton!
    var aboutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.contents = UIImage(named: "Background")!.CGImage;
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(tabBar)
    }
    
    func getTabBarViewController() -> UITabBarController {
        return (self.parentViewController as! UITabBarController)
    }
}
