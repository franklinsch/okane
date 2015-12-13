//
//  RequestWrapper.swift
//  okane-ios
//
//  Created by Saurav Mitra on 13/12/2015.
//  Copyright © 2015 Franklin Schrans. All rights reserved.
//

import UIKit
import Parse

class RequestWrapper {
    var requestObject: PFObject! = nil
    var image: UIImage?
    
    init(requestid: REQUESTID, image: UIImage?) {
        do {
            requestObject = try PFQuery(className: "Request").getObjectWithId(requestid.id)
        } catch {}
        self.image = image
    }
}