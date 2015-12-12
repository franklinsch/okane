//
//  RequestTableViewCell.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class RequestTableViewCell: UITableViewCell {

    @IBOutlet weak var requestImage: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var interestLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var requestGoalView: RequestGoalView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.requestImage.layer.cornerRadius = requestImage.layer.frame.width / 2
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
