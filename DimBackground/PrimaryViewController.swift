//
//  PrimaryViewController.swift
//  DimBackground
//
//  Created by Chris Forant on 12/27/15.
//  Copyright © 2015 Totem. All rights reserved.
//

import UIKit

class PrimaryViewController: UIViewController {
    
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5

    override func viewDidLoad() { super.viewDidLoad() }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dimmer(.In, color: nil, alpha: dimLevel, speed: dimSpeed)
    }
    
    @IBAction func unwindFromSecondary(segue: UIStoryboardSegue) {
        dimmer(.Out, color: nil, alpha: 0, speed: dimSpeed)
    }
}
