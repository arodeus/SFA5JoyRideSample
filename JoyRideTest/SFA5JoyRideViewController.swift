//
//  SFA5JoyRideViewController.swift
//  JoyRideTest
//
//  Created by Diego Giardinetto on 26/04/18.
//  Copyright © 2018 iCatalogue GmbH. All rights reserved.
//

import UIKit

extension SFA5JoyRideViewController {
    @IBAction func jumpToNextStep(sender: UIButton?) {
        let nextPage = self.currentIndex + 1
        if let originVC = (self.presentingViewController as? UINavigationController)?.topViewController {
            self.dismiss(animated: true) {
                if nextPage < SFA5JoyRideHelper.sharedInstance.pages.count {
                    SFA5JoyRideHelper.sharedInstance.findJoyRide(at: nextPage, in: originVC)
                }
            }
        }
    }
}

class SFA5JoyRideViewController: UIViewController {
    @IBOutlet var textView01: UITextView!
    @IBOutlet var uiButtonNext: UIButton!
    
    var currentIndex: Int = 0
    var pageInformations: SFA5JoyRidePage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if self.currentIndex == (SFA5JoyRideHelper.sharedInstance.pages.count - 1) {
            self.uiButtonNext.setTitle("Close", for: UIControlState.normal)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let _pageInformations = self.pageInformations {
            self.textView01.attributedText = _pageInformations.itemDescription.convertHtml()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
