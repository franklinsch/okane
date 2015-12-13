//
//  AccountViewController.swift
//  okane-ios
//
//  Created by Saurav Mitra on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}