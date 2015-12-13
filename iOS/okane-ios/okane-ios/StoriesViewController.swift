//
//  StoriesViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit
import Parse

class StoriesViewController: UIViewController, TabBarViewController {

    @IBOutlet weak var storiesTableView: UITableView!
    //let tableViewController = RequestTableViewController()
    //var tabBarViewController: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var requests = PFQuery(className: "Request").findObjects()
       
        view.layer.contents = UIImage(named: "Background")!.CGImage;

        let tabBarFrame = CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50)
        let tabBar = TabBarView(frame: tabBarFrame)
        tabBar.superView = self
        
        self.view.addSubview(tabBar)
        
        //storiesTableView.delegate = tableViewController
        //storiesTableView.dataSource = tableViewController
        
        //tabBarViewController = self.parentViewController?.parentViewController as! UITabBarController
        //tabBarViewController.tabBar.hidden = true
    }
    
    func getTabBarViewController() -> UITabBarController {
        return tabBarController!
    }
    
    override func viewDidAppear(animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        //self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "storySegue" {
            if let destination = segue.destinationViewController as? StoryDetailViewController {
                if let index = storiesTableView.indexPathForSelectedRow?.row {
                    //let requestWrapper = tableViewController.requests[index]
                    //destination.requestWrapper = requestWrapper
                }
            }
        }
    }

}
