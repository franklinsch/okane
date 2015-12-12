//
//  requestGoalLabel.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class RequestGoalView: UIView {

    let kProgressViewHeight: CGFloat = 10
    
    var progressView: UIView!

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    
    init(frame: CGRect, progressRatio: Float) {
        super.init(frame: frame)
        
        let progressViewFrame = CGRect(x: super.bounds.origin.x, y: super.bounds.origin.y, width: super.bounds.width * CGFloat(progressRatio), height: kProgressViewHeight)
        
        progressView = UIView(frame: progressViewFrame)
        progressView.backgroundColor = UIColor.grayColor()
        
        addSubview(progressView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
