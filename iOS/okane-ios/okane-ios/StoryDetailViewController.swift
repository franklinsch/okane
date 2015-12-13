//
//  StoryDetailViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController, TabBarViewController {
    
    var request: Request!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var requestGoal: RequestGoalView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(tabBar)
        
        self.titleLabel.text = request.title
        self.resultImage.image = request.image
        self.requestGoal.progressRatio = CGFloat(request.amountRaised) / CGFloat(request.amountToRaise)
        self.requestGoal.amount = request.amountToRaise
        self.interestLabel.text = "\(request.interestRate)% interest"
        self.descriptionView.text = request.description
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
