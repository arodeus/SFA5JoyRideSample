//
//  ViewController.swift
//  JoyRideTest
//
//  Created by Diego Giardinetto on 26/04/18.
//  Copyright © 2018 iCatalogue GmbH. All rights reserved.
//

import UIKit

extension ViewController {
    func runJoyride() {
        SFA5JoyRideHelper.sharedInstance.findJoyRide(at: 0, in: self)
    }
    
    @IBAction func restart(sender: UIButton?) {
        self.runJoyride()
    }
}

class ViewController: UIViewController {
    @IBOutlet var barButton01: SFA5JoyRideUIBarButtonItem!
    @IBOutlet var barButton02: SFA5JoyRideUIBarButtonItem!
    @IBOutlet var barButton03: SFA5JoyRideUIBarButtonItem!
    @IBOutlet var barButton04: SFA5JoyRideUIBarButtonItem!
    @IBOutlet var uiButton01: SFA5JoyRideUIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.barButton01.joyrideTag = "barButton01"
        self.barButton02.joyrideTag = "barButton02"
        self.barButton03.joyrideTag = "barButton03"
        self.barButton04.joyrideTag = "barButton04"
        self.uiButton01.joyrideTag = "uiButton01"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.runJoyride()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

