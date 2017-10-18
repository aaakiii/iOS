import UIKit

class ViewController: UIViewController {

    let randomNum = Int(arc4random_uniform(4))
    let URLs = ["http://imgur.com/zdwdenZ.png","http://imgur.com/bktnImE.png","http://imgur.com/CoQ8aNl.png","http://imgur.com/2vQtZBb.png","http://imgur.com/y9MIaCS.png"]
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage()
    }

    func getImage() {
        let catPictureURL = URL(string: URLs[randomNum])!
        let session = URLSession(configuration: .default)
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // Check response.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Convert the Data into an image.
                        let img = UIImage(data: imageData)
                        self.imageView.image = img
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
        }
        downloadPicTask.resume()
    }

    
}

