import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var navHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let stackView = UIStackView(frame: CGRect)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(_ sender: Any) {
        UIView.animate(withDuration: 2.0, delay: 0.0, usingSpringWithDamping: 0.0, initialSpringVelocity: 0.0, options: .allowAnimatedContent, animations:{
            if(self.navHeight.constant == 200){
                self.plusButton.transform = self.plusButton.transform.rotated(by: -CGFloat(Double.pi / 4))
                self.navHeight.constant = 64
            } else {
                self.plusButton.transform = self.plusButton.transform.rotated(by: CGFloat(Double.pi / 4))
                self.navHeight.constant = 200
            }
        },completion: nil)
        print("Button tapped")
    }
    
}

