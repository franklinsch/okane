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
    
    @IBOutlet weak var titleTextField: HoshiTextField!
    @IBOutlet weak var descriptionTextField: HoshiTextField!
    @IBOutlet weak var amountToRaiseTextField: HoshiTextField!
    @IBOutlet weak var interestRateTextField: HoshiTextField!
    @IBOutlet weak var returnDateTextField: HoshiTextField!
    @IBOutlet weak var createAStory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainScrollView.alwaysBounceVertical = true
        
        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(tabBar)
        
        tabBarViewController = self.parentViewController as! UITabBarController
        tabBarViewController.tabBar.hidden = true
        
        view.layer.contents = UIImage(named: "Background.png")!.CGImage
        
        submitView.backgroundColor = Colors.darkBlue
        submitView.layer.cornerRadius = 5.0
        submitView.alpha = 0.75
        
        createAStory.alpha = 0
        titleTextField.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        self.createAStory.alpha = 0.2
        self.submitView.alpha = 0
        UIView.animateWithDuration(0.4, animations: {
                self.createAStory.alpha = 1.0
        })
        
        let textFields = [self.titleTextField, self.descriptionTextField, self.descriptionTextField, self.amountToRaiseTextField, self.interestRateTextField, self.returnDateTextField]
        
        var i = 0.0
        for field in textFields {
            field.transform = CGAffineTransformMakeTranslation(0, -15)
            field.alpha = 0
            UIView.animateWithDuration(0.2, delay: 0.2 * i, options: UIViewAnimationOptions.TransitionNone, animations: {
                field.transform = CGAffineTransformIdentity
                field.alpha = 1
                }, completion: { _ in
            })
            i++
        }
        
        UIView.animateWithDuration(0.5, delay: 0.8, options: .TransitionNone, animations: {
                self.submitView.alpha = 1
            }, completion: { _ in
                
        })
    }
    
    @IBAction func didPressSubmit(sender: AnyObject) {
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
