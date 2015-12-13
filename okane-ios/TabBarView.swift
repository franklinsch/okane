//
//  TabBarView.swift
//  okane-ios
//
//  Created by Franklin Schrans on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class TabBarView: UIView {
    var storiesButton: UIButton
    var accountButton: UIButton
    var homeButton: UIButton
    
    var storiesLabel: UILabel
    var accountLabel: UILabel
    var homeLabel: UILabel
    
    var storiesImageView: UIImageView
    var accountImageView: UIImageView
    
    var superView: TabBarViewController!
    
    override init(frame: CGRect) {
        let storiesFrame = CGRect(x: frame.origin.x, y: 0, width: frame.width / 2, height: frame.height)
        storiesButton = UIButton(frame: storiesFrame)
        
        let accountFrame = CGRect(x: frame.origin.x + storiesFrame.width, y: 0, width: frame.width / 2, height: frame.height)
        accountButton = UIButton(frame: accountFrame)
        
        let homeWidth = CGFloat(75)
        let homeHeight = CGFloat(75)
        
        let homeFrame = CGRect(x: CGRectGetMidX(frame) - homeWidth / 2, y: 0 - (homeWidth / 3), width: homeWidth, height: homeHeight)
        homeButton = UIButton(frame: homeFrame)
        
        storiesButton.backgroundColor = Colors.lightGray
        accountButton.backgroundColor = Colors.lightGray
        homeButton.backgroundColor = Colors.darkBlue
        
        homeButton.layer.cornerRadius = homeButton.layer.frame.width / 2
        homeButton.clipsToBounds = true
        
        homeButton.layer.borderColor = Colors.lightGray.CGColor
        homeButton.layer.borderWidth = 5.0
        
        let buttonLabelWidth = CGFloat(50)
        let buttonLabelHeight = CGFloat(4)
        
        storiesLabel = UILabel(frame: CGRectMake(CGRectGetMidX(storiesButton.frame) - buttonLabelWidth, self.storiesButton.frame.height - buttonLabelHeight * 5, buttonLabelWidth, buttonLabelHeight))
        
        storiesLabel.text = "Stories"
        storiesLabel.font = UIFont.systemFontOfSize(12)
        storiesLabel.sizeToFit()
        storiesLabel.textColor = Colors.darkBlue
        storiesButton.addSubview(storiesLabel)
        
        accountLabel = UILabel(frame: CGRectMake(CGRectGetMidX(accountButton.frame) / 2 - buttonLabelWidth, self.accountButton.frame.height - buttonLabelHeight * 5, buttonLabelWidth, buttonLabelHeight))
        
        accountLabel.text = "Account"
        accountLabel.font = UIFont.systemFontOfSize(12)
        accountLabel.sizeToFit()
        accountLabel.textColor = Colors.darkBlue
        accountButton.addSubview(accountLabel)
        
        let homeLabelDiameter = CGFloat(40)
        homeLabel = UILabel(frame: CGRectMake(17, 12, homeLabelDiameter, homeLabelDiameter))
        
        homeLabel.text = "金"
        homeLabel.font = UIFont.systemFontOfSize(40)
        homeLabel.sizeToFit()
        homeLabel.textColor = Colors.lightGreen
        homeButton.addSubview(homeLabel)
        
        accountLabel.text = "Account"
        accountLabel.font = UIFont.systemFontOfSize(12)
        accountLabel.sizeToFit()
        accountLabel.textColor = Colors.darkBlue
        accountButton.addSubview(accountLabel)
        
        accountImageView = UIImageView(image: UIImage(named: "fruits.jpg"))
        storiesImageView = UIImageView(image: UIImage(named: "ribs.jpg"))
        
        
        super.init(frame: frame)
        self.addSubview(storiesButton)
        self.addSubview(accountButton)
        self.addSubview(homeButton)
        
        self.backgroundColor = UIColor.lightGrayColor()
        
        storiesButton.addTarget(self, action: Selector("pressedStories"), forControlEvents: .TouchUpInside)
        accountButton.addTarget(self, action: Selector("pressedAccount"), forControlEvents: .TouchUpInside)
        homeButton.addTarget(self, action: Selector("pressedHome"), forControlEvents: .TouchUpInside)
        
    }
    
    func pressedStories() {
        superView.getTabBarViewController().selectedIndex = 0
    }
    
    func pressedAccount() {
        superView.getTabBarViewController().selectedIndex = 2
    }
    
    func pressedHome() {
        superView.getTabBarViewController().selectedIndex = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
