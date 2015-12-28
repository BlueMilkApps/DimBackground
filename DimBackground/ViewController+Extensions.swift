//
//  ViewController+Dimmer.swift
//  DimBackground
//
//  Created by Chris Forant on 12/28/15.
//  Copyright © 2015 Totem. All rights reserved.
//

import UIKit

extension UIViewController {
    
    enum DimmerDirection {
        case In, Out
    }
    
    func dimmer(direction: DimmerDirection, color: UIColor?, alpha: CGFloat?, speed: Double?) {
        
        switch direction {
        case .In:
            
            // Create and add dim view
            let dimView = UIView(frame: view.frame)
            dimView.backgroundColor = color ?? UIColor.blackColor()
            dimView.alpha = 0.0
            view.addSubview(dimView)
            
            // Animate alpha (the actual "dimming" effect)
            UIView.animateWithDuration(speed ?? 0) { () -> Void in
                dimView.alpha = alpha ?? 0
            }
            
        case .Out:
            UIView.animateWithDuration(speed ?? 0, animations: { () -> Void in
                self.view.subviews.last?.alpha = alpha ?? 0
                }, completion: { (complete) -> Void in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}