//
//  RequestTableViewController.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class RequestTableViewController: UITableViewController {
    
    var requests: [Request] = [Request(title: "I need food", description: "food food food food food food food food food food food food food food food food food food food food ", amountToRaise: 300, amountRaised: 250, user: USERID(id: 2), date: Date(year: 2015, month: 11, day: 12), image: UIImage(named: "ribs.jpg"), interestRate: 5),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83),
        Request(title: "Bawawa", description: "Wtf ali", amountToRaise: 3, amountRaised: 1, user: USERID(id: 4), date: Date(year: 2052, month: 24, day: 24), image: nil, interestRate: 83)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return requests.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("requestCell", forIndexPath: indexPath)

        let request = requests[indexPath.row]
        
        guard let requestCell = cell as? RequestTableViewCell else {
            fatalError("Table view cell couldn't be casted to RequestTableViewCell")
        }
    
        if let requestImage = request.image {
            let requestImageView = UIImageView(image: requestImage)
            requestImageView.frame = requestCell.requestImage.bounds
            requestImageView.contentMode = UIViewContentMode.ScaleAspectFit
            requestImageView.layer.cornerRadius = requestImageView.layer.frame.width / 2
            requestImageView.clipsToBounds = true
            
            requestCell.requestImage.addSubview(requestImageView)
        }
        
        requestCell.titleLabel.text = request.title
        requestCell.interestLabel.text = "\(request.interestRate)%"
        requestCell.descriptionLabel.text = request.description
        
        requestCell.requestGoalView.progressRatio = CGFloat(request.amountRaised) / CGFloat(request.amountToRaise)
        requestCell.requestGoalView.amount = request.amountToRaise

        return cell
    }
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell,
        forRowAtIndexPath indexPath: NSIndexPath) {
//            if !preventAnimation.contains(indexPath) {
//                preventAnimation.insert(indexPath)
                animate(cell)
//            }
    }
    
    var preventAnimation = Set<NSIndexPath>()
    let TipInCellAnimatorStartTransform:CATransform3D = {
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPointMake(-20, -20)
        var startTransform = CATransform3DIdentity
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0)
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0)
        
        return startTransform
    }()
    
    func animate(cell:UITableViewCell) {
        let view = cell.contentView
        let rotationDegrees: CGFloat = -15.0
        let rotationRadians: CGFloat = rotationDegrees * (CGFloat(M_PI)/180.0)
        let offset = CGPointMake(-20, -20)
        var startTransform = CATransform3DIdentity // 2
        startTransform = CATransform3DRotate(CATransform3DIdentity,
            rotationRadians, 0.0, 0.0, 1.0) // 3
        startTransform = CATransform3DTranslate(startTransform, offset.x, offset.y, 0.0) // 4
        
        // 5
        view.layer.transform = startTransform
        view.layer.opacity = 0.8
        
        // 6
        UIView.animateWithDuration(0.4) {
            view.layer.transform = CATransform3DIdentity
            view.layer.opacity = 1
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
