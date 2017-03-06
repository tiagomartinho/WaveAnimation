import UIKit

@IBDesignable
class SegmentedProgressBarView: ReusableView {

    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    @IBOutlet weak var fifthView: UIView!

    override func nibName() -> String {
        return "SegmentedProgressBarView"
    }

    func animate() {

        let stopDelay = 0.6
        let duration = 0.4
        let phaseShift = 0.1
        let scaleY: CGFloat = 0.3
        let views = [firstView, secondView, thirdView, fourthView, fifthView]

        _ = views.map { $0!.transform = CGAffineTransform(scaleX: 1.0, y: scaleY) }

        Timer.scheduledTimer(withTimeInterval: duration * 3 + stopDelay, repeats: true) { _ in
            for (index, viewToAnimate) in views.enumerated() {
                let delay = Double(index) * phaseShift
                UIView.animate(withDuration: duration, delay: delay, options: .curveEaseIn, animations: {
                    viewToAnimate!.transform = CGAffineTransform(scaleX: 1.0, y: scaleY)
                }, completion: nil)
                UIView.animate(withDuration: duration, delay: duration + delay, options: .curveEaseOut, animations: {
                    viewToAnimate!.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                }, completion: nil)
                UIView.animate(withDuration: duration, delay: duration + duration + delay, options: .curveEaseIn, animations: {
                    viewToAnimate!.transform = CGAffineTransform(scaleX: 1.0, y: scaleY)
                }, completion: nil)
            }
        }
    }
}
