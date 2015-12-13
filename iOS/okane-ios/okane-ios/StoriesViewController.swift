//
//  StoriesViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class StoriesViewController: UIViewController {

    @IBOutlet weak var storiesTableView: UITableView!
    let tableViewController = RequestTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        storiesTableView.delegate = tableViewController
        storiesTableView.dataSource = tableViewController
    }
    
    override func viewDidAppear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
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
                    let request = tableViewController.requests[index]
                    destination.request = request
                }
            }
        }
    }

}
