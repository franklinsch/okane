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
    var moneyValLabel: UILabel!
    var investmentDisplayLabel: UILabel!
    var investmentsBox: UIView!
    var storiesDisplayLabel: UILabel!
    var storiesBox: UIView!
    var tutorialButton: UIButton!
    var aboutButton: UIButton!
    
    var user: USERID!
    var userFullName: String = "Ali Attar"
    var moneyVal: Float = 50.2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attrs = [NSUnderlineStyleAttributeName : 1]
        
        view.layer.contents = UIImage(named: "Background")!.CGImage;
        
        //profileImage = UIImage("")!.CGImage;
        
        profileName = UILabel(frame: CGRectMake(105, 50, 100, 40))
        profileName.text = userFullName
        profileName.font = profileName.font.fontWithSize(25)
        
        accountSettingsButton = UIButton(frame: CGRectMake(100, 90, 150, 20))
        var buttonTitleStr = NSMutableAttributedString(string: "Account Settings", attributes: attrs)
        accountSettingsButton.setAttributedTitle(buttonTitleStr, forState: .Normal)
        
        statsButton = UIButton(frame: CGRectMake(200, 200, 90, 30))
        statsButton.setTitle("Statistics", forState: .Normal)
        statsButton.backgroundColor = Colors.darkBlue
        statsButton.layer.cornerRadius = 6.0
        
        collectMoneyButton = UIButton(frame: CGRectMake(20, 200, 330, 40))
        collectMoneyButton.setTitle("Transfer money back to account", forState: .Normal)
        collectMoneyButton.backgroundColor = Colors.lightGreen
        collectMoneyButton.layer.cornerRadius = 6.0
        
        moneyDisplayLabel = UILabel(frame: CGRectMake(20, 120, 150, 30))
        moneyDisplayLabel.text = "My Money"
        
        moneyValLabel = UILabel(frame: CGRectMake(20, 145, 150, 30))
        moneyValLabel.text = String(moneyVal)
        
        investmentDisplayLabel = UILabel(frame: CGRectMake(20, 300, 150, 30))
        investmentDisplayLabel.text = "My Investments"
        
        investmentsBox = UIView(frame: CGRectMake(0, 0, 150, 20))
        
        storiesDisplayLabel = UILabel(frame: CGRectMake(20, 450, 150, 30))
        storiesDisplayLabel.text = "My Stories"
        
        storiesBox = UIView(frame: CGRectMake(0, 0, 150, 20))
        
        let attrs2 = [NSForegroundColorAttributeName: Colors.darkBlue, NSUnderlineStyleAttributeName : 1]
        
        tutorialButton = UIButton(frame: CGRectMake(60, 550, 150, 20))
        buttonTitleStr = NSMutableAttributedString(string: "Tutorial", attributes: attrs2)
        tutorialButton.setAttributedTitle(buttonTitleStr, forState: .Normal)
        tutorialButton.titleLabel!.font = tutorialButton.titleLabel!.font.fontWithSize(20)
        
        aboutButton = UIButton(frame: CGRectMake(180, 550, 150, 20))
        buttonTitleStr = NSMutableAttributedString(string: "About us", attributes: attrs2)
        aboutButton.setAttributedTitle(buttonTitleStr, forState: .Normal)
        aboutButton.titleLabel!.font = aboutButton.titleLabel!.font.fontWithSize(20)
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(profileName)
        self.view.addSubview(accountSettingsButton)
        self.view.addSubview(statsButton)
        self.view.addSubview(collectMoneyButton)
        self.view.addSubview(moneyDisplayLabel)
        self.view.addSubview(moneyValLabel)
        self.view.addSubview(investmentDisplayLabel)
        self.view.addSubview(investmentsBox)
        self.view.addSubview(storiesDisplayLabel)
        self.view.addSubview(storiesBox)
        self.view.addSubview(tutorialButton)
        self.view.addSubview(aboutButton)
        
        self.view.addSubview(tabBar)
    }
    
    func getTabBarViewController() -> UITabBarController {
        return (self.parentViewController as! UITabBarController)
    }
}
