//
//  requestGoalLabel.swift
//  okane-ios
//
//  Created by Franklin Schrans on 12/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit

class RequestGoalView: UIView {

    let kProgressViewHeight: CGFloat = 5
    let kProgressViewMaxWidth: CGFloat = 40
    let kProgressBarAmountSeparation: CGFloat = 5
   
    private var progressView: UIView!
    private var amountLabel: UILabel!
    
    var progressRatio: CGFloat = 0 {
        didSet {
            let progressBarHeight = bounds.origin.y + frame.height - kProgressBarAmountSeparation
            let progressBarWidth = kProgressViewMaxWidth * CGFloat(progressRatio)
            
            let progressViewFrame = CGRect(x: bounds.origin.x, y: progressBarHeight, width: progressBarWidth, height: kProgressViewHeight)
            
            let fillWidth = kProgressViewMaxWidth * CGFloat(1 - progressRatio)
            
            let progressViewFillFrame = CGRect(x: progressViewFrame.width, y: 0, width: fillWidth, height: kProgressViewHeight)
            let progressViewFill = UIView(frame: progressViewFillFrame)
            
            if let view = progressView {
                view.removeFromSuperview()
            }
            progressView = UIView(frame: progressViewFrame)
            progressViewFill.backgroundColor = UIColor(netHex: 0xDBDDDE)
            progressView.addSubview(progressViewFill)
            
            if (progressRatio > 0.5) {
                self.progressView.backgroundColor = UIColor(netHex: 0xA4E786)
            } else {
                self.progressView.backgroundColor = UIColor(netHex: 0xFF4981)
            }
            
            addSubview(progressView)
        }
    }
    
    var amount: Int = 0 {
        didSet {
            let amountLabelFrame = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: progressView.frame.width, height: 40)
            
            if let label = amountLabel {
                label.removeFromSuperview()
            }
            
            amountLabel = UILabel(frame: amountLabelFrame)
            amountLabel.text = "£\(amount)"
            amountLabel.textAlignment = .Right
            amountLabel.sizeToFit()
            
            addSubview(amountLabel)
        }
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func drawRect(rect: CGRect) {
//        // Drawing code
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.whiteColor()
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}
