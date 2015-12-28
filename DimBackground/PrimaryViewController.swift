import UIKit

class PrimaryViewController: UIViewController, Dimmable {
    
    let dimLevel: CGFloat = 0.5
    let dimSpeed: Double = 0.5

    override func viewDidLoad() { super.viewDidLoad() }
    override func didReceiveMemoryWarning() { super.didReceiveMemoryWarning() }
    
    // MARK: - Segues
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        dimmer(.In, color: nil, alpha: dimLevel, speed: dimSpeed)
    }
    
    @IBAction func unwindFromSecondary(segue: UIStoryboardSegue) {
        dimmer(.Out, color: nil, alpha: nil, speed: dimSpeed)
    }
}
