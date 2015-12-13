//
//  StoryDetailViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class StoryDetailViewController: UIViewController {
    
    var request: Request!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var requestGoal: RequestGoalView!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = request.title
        self.resultImage.image = request.image
        self.requestGoal.progressRatio = CGFloat(request.amountRaised) / CGFloat(request.amountToRaise)
        self.requestGoal.amount = request.amountToRaise
        self.interestLabel.text = "\(request.interestRate)% interest"
        self.descriptionView.text = request.description
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
