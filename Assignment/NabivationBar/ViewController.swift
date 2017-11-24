import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var navHeight: NSLayoutConstraint!
    
    @IBOutlet weak var navView: UIView!
    let stackView = UIStackView(frame: CGRect(x: 0, y: 64, width: UIScreen.main.bounds.width, height: 136))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       setUpView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpView(){
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        let images = [UIImageView(image: #imageLiteral(resourceName: "ramen")), UIImageView(image: #imageLiteral(resourceName: "oreos")), UIImageView(image: #imageLiteral(resourceName: "popsicle")), UIImageView(image: #imageLiteral(resourceName: "pop_tarts")), UIImageView(image: #imageLiteral(resourceName: "pizza_pockets"))]
        images.forEach { (image) in
            image.contentMode = .scaleAspectFit
            self.stackView.addArrangedSubview(image)
        }
    }

    @IBAction func buttonTapped(_ sender: Any) {
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.0, options: .allowAnimatedContent, animations: {
            if (self.navHeight.constant == 200) {
                self.plusButton.transform = self.plusButton.transform.rotated(by: -CGFloat(Double.pi / 4))
                self.navHeight.constant = 64
                self.navView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = false
                self.stackView.removeFromSuperview()
                
            } else {
                self.plusButton.transform = self.plusButton.transform.rotated(by: CGFloat(Double.pi / 4))
                self.navHeight.constant = 200
                self.navView.addSubview(self.stackView)
                self.navView.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor).isActive = true
            }
            self.view.layoutIfNeeded()
        }, completion: nil)
        print("plus button pressed")
    }
    
}

