import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedPB: SegmentedProgressBarView!

    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedPB.animate()
    }
}
