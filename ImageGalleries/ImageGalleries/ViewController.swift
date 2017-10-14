//
//  ViewController.swift
//  ImageGalleries
//
//  Created by Aki on 2017-10-13.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    let firstImageView = UIImageView()
    let secondImageView = UIImageView()
    let thirdImageView = UIImageView()
    
    var img1 = UIImage()
    var img2 = UIImage()
    var img3 = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        img1 = self.resizeImage(image: UIImage(named: "Photo1")!, targetSize: CGSize(width: 400.0, height: 400.0))
        firstImageView.image = img1
        firstImageView.translatesAutoresizingMaskIntoConstraints  = false
        
        img2 = self.resizeImage(image: UIImage(named: "Photo2")!, targetSize: CGSize(width: 400.0, height: 400.0))
        secondImageView.image = img2
        secondImageView.translatesAutoresizingMaskIntoConstraints = false
        
        img3 = self.resizeImage(image: UIImage(named: "Photo3")!, targetSize: CGSize(width: 400.0, height: 400.0))
        thirdImageView.image =  img3
        thirdImageView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(firstImageView)
        scrollView.addSubview(secondImageView)
        scrollView.addSubview(thirdImageView)
        
        let firstViewTopConstraint = NSLayoutConstraint(item: firstImageView,
                                                        attribute: NSLayoutAttribute.top,
                                                        relatedBy: NSLayoutRelation.equal,
                                                        toItem: scrollView,
                                                        attribute: NSLayoutAttribute.top,
                                                        multiplier: 1.0,
                                                        constant: 700)
        scrollView.addConstraint(firstViewTopConstraint)
        
        let secondViewTopConstraint = NSLayoutConstraint(item: secondImageView,
                                                       attribute: NSLayoutAttribute.top,
                                                       relatedBy: NSLayoutRelation.equal,
                                                       toItem: scrollView,
                                                       attribute: NSLayoutAttribute.top,
                                                       multiplier: 1.0,
                                                       constant: 100)
        scrollView.addConstraint(secondViewTopConstraint)
        
        let thirdViewTopConstraint = NSLayoutConstraint(item: thirdImageView,
                                                       attribute: NSLayoutAttribute.top,
                                                       relatedBy: NSLayoutRelation.equal,
                                                       toItem: scrollView,
                                                       attribute: NSLayoutAttribute.top,
                                                       multiplier: 1.0,
                                                       constant: 400)
        scrollView.addConstraint(thirdViewTopConstraint)
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: 1200)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func resizeImage(image: UIImage,targetSize: CGSize) -> UIImage{
        let size = image.size
        let widthRatio = targetSize.width/image.size.width
        let heightRatio = targetSize.height/image.size.height
        
        var newSize:CGSize
        if(widthRatio > heightRatio){
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
            
        }else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
        
        
    }



}

