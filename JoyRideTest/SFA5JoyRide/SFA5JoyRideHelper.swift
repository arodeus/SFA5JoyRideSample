//
//  SFA5JoyRideHelper.swift
//  JoyRideTest
//
//  Created by Diego Giardinetto on 26/04/18.
//  Copyright © 2018 iCatalogue GmbH. All rights reserved.
//

import UIKit

let _newLine = "<br />"
let _loremIpsum = "<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem.</p>"

struct SFA5JoyRidePage: Codable {
    var index: Int = 0
    var tag: String?
    var itemDescription: String = ""
}

extension SFA5JoyRideHelper {
    fileprivate func buildSamples() {
        let sampleTags: [String] = [
            "barButton01", "barButton02", "uiButton01", "barButton03", "barButton04"
        ]
        
        for index in 0..<sampleTags.count {
            let _description = "<h3><b>Sample \(sampleTags[index])\(_newLine)</b></h3>\(_loremIpsum)"
            self.pages.append(SFA5JoyRidePage(index: index, tag: sampleTags[index], itemDescription: _description))
        }
    }
}

class SFA5JoyRideHelper: NSObject {
    static var sharedInstance = SFA5JoyRideHelper()
    var pages: [SFA5JoyRidePage] = []
    
    override private init() {
        super.init()
        self.buildSamples()
    }
    
    func findJoyRide(at index: Int, in controller: UIViewController) {
        if index < 0 || index >= pages.count {
            return
        }
        
        let _page = self.pages[index]
        
        if let _leftBarButtonItems = controller.navigationItem.leftBarButtonItems {
            for _item in _leftBarButtonItems {
                if _item is SFA5JoyRideUIBarButtonItem {
                    if (_item as! SFA5JoyRideUIBarButtonItem).joyrideTag == _page.tag {
                        self.openJoyRide(with: _page, in: controller, from: _item)
                        return
                    }
                }
            }
        }
        
        if let _rightBarButtonItems = controller.navigationItem.rightBarButtonItems {
            for _item in _rightBarButtonItems {
                if _item is SFA5JoyRideUIBarButtonItem {
                    if (_item as! SFA5JoyRideUIBarButtonItem).joyrideTag == _page.tag {
                        self.openJoyRide(with: _page, in: controller, from: _item)
                        return
                    }
                }
            }
        }
        
        for _item in controller.view.subviews {
            if _item is SFA5JoyRideUIButton {
                if (_item as! SFA5JoyRideUIButton).joyrideTag == _page.tag {
                    self.openJoyRide(with: _page, in: controller, from: _item)
                    return
                }
            }
        }
    }
    
    // Open popover
    private func openJoyRide(with page: SFA5JoyRidePage, in controller: UIViewController, from view: NSObject) {
        let vc = controller.storyboard?.instantiateViewController(withIdentifier: "SFA5JoyRideViewController") as! SFA5JoyRideViewController
        vc.pageInformations = page
        vc.currentIndex = page.index
        vc.modalPresentationStyle = .popover
        controller.present(vc, animated: true, completion: nil)
        
        vc.popoverPresentationController?.permittedArrowDirections = .any
        if view is SFA5JoyRideUIBarButtonItem {
            vc.popoverPresentationController?.barButtonItem = (view as! SFA5JoyRideUIBarButtonItem)
        } else if view is SFA5JoyRideUIButton {
            let _button = view as! SFA5JoyRideUIButton
            vc.popoverPresentationController?.sourceView = _button
            vc.popoverPresentationController?.sourceRect = CGRect(x: 0.0, y: 0.0, width: _button.frame.size.width, height: _button.frame.size.height)
        }
    }
}
