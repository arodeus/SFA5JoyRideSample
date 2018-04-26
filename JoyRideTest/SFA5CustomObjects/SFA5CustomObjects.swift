//
//  SFA5CustomObjects.swift
//  JoyRideTest
//
//  Created by Diego Giardinetto on 26/04/18.
//  Copyright © 2018 iCatalogue GmbH. All rights reserved.
//

import UIKit

// Custom Classes
class SFA5JoyRideUIButton: UIButton {
    var joyrideTag: String?
}

class SFA5JoyRideUIBarButtonItem: UIBarButtonItem {
    var joyrideTag: String?
}

// Extensions
extension String {
    func convertHtml() -> NSAttributedString{
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html], documentAttributes: nil)
        } catch _ {
            return NSAttributedString()
        }
    }
}
