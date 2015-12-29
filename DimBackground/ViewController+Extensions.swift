import UIKit

enum Direction { case In, Out }

protocol Dimmable { }

extension Dimmable where Self: UIViewController {
    
    func dim(direction: Direction, color: UIColor = UIColor.blackColor(), alpha: CGFloat = 0.0, speed: Double = 0.0) {
        
        switch direction {
        case .In:
            
            // Create and add a dim view
            let dimView = UIView(frame: view.frame)
            dimView.backgroundColor = color
            dimView.alpha = 0.0
            view.addSubview(dimView)
            
            // Deal with Auto Layout
            dimView.translatesAutoresizingMaskIntoConstraints = false
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[dimView]|", options: [], metrics: nil, views: ["dimView": dimView]))
            
            // Animate alpha (the actual "dimming" effect)
            UIView.animateWithDuration(speed) { () -> Void in
                dimView.alpha = alpha
            }
            
        case .Out:
            UIView.animateWithDuration(speed, animations: { () -> Void in
                self.view.subviews.last?.alpha = alpha ?? 0
                }, completion: { (complete) -> Void in
                    self.view.subviews.last?.removeFromSuperview()
            })
        }
    }
}