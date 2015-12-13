//
//  StoryDetailViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit
import ParseUI

class StoryDetailViewController: UIViewController, TabBarViewController {
    
    var requestWrapper: RequestWrapper!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var requestGoal: RequestGoalView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let amountRaised = requestWrapper.requestObject["amountRaised"] as! Int
        let amountToRaise = requestWrapper.requestObject["amountToRaise"] as! Int
        
        self.titleLabel.text = (requestWrapper.requestObject["title"] as! String)
        //self.resultImage.image =
        //self.resultImage = PFImageView()
        //self.resultImage.image = nil
        //self.resultImage.file = requestWrapper.requestObject["image"] as! PFFile
        //self.resultImage.loadInBackground()
        self.requestGoal.progressRatio = CGFloat(amountRaised) / CGFloat(amountToRaise)
        self.requestGoal.amount = requestWrapper.requestObject["amountToRaise"] as! Int
        self.interestLabel.text = "\(requestWrapper.requestObject["interestRate"] as! Int)% interest"
        self.descriptionView.text = requestWrapper.requestObject["description"] as! String
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        view.layer.contents = UIImage(named: "Background")!.CGImage;
    }
    
    func getTabBarViewController() -> UITabBarController {
        return (self.navigationController?.viewControllers[(self.navigationController?.viewControllers.count)! - 2] as! StoriesViewController).getTabBarViewController()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func invest(sender: AnyObject) {
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
