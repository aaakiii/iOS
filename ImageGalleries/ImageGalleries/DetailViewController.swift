//
//  DetailViewController.swift
//  ImageGalleries
//
//  Created by 岡田暁 on 2017-10-13.
//  Copyright © 2017 Aki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    
    var image: UIImage?
    var originalWidth: CGFloat?
    var originalHeight: CGFloat?
    var lastScale = CGFloat(1.0)  // 1.0 == original image size, not screen size
    var pinchingScale = CGFloat(1.0)
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareImage()
        initScale()
        updateImageSize()
        
        scrollView.addGestureRecognizer(UIPinchGestureRecognizer(target: self, action: #selector(onpinch)))

    }

    func prepareImage() {
        if image == nil {
            image = UIImage(named: "Photo1")
        }
        
        if let i = image {
            imageView.image = i
            
            originalWidth = i.size.width
            widthConstraint = imageView.widthAnchor.constraint(equalToConstant: originalWidth!)
            widthConstraint!.isActive = true
            
            originalHeight = i.size.height
            heightConstraint = imageView.heightAnchor.constraint(equalToConstant: originalHeight!)
            heightConstraint!.isActive = true
        }
    }
    
    func initScale() {
        if let ow = originalWidth, let oh = originalHeight {
            let scaleWidth = view.frame.width / ow
            let scaleHeight = view.frame.height / oh
            lastScale = min(scaleWidth, scaleHeight)
        }
    }
    
    func updateImageSize() {
        if let ow = originalWidth, let oh = originalHeight, let wc = widthConstraint, let hc = heightConstraint {
            let currentScale = lastScale * pinchingScale
            let width = ow * currentScale
            let height = oh * currentScale
            
            wc.constant = width
            hc.constant = height
        }
    }
    
    @objc func onpinch(sender: UIPinchGestureRecognizer) {
        if sender.state == .changed {
            pinchingScale = sender.scale
            updateImageSize()
        }
        else if sender.state == .ended {
            lastScale *= pinchingScale
        }
    }
    
    @IBAction func back_onTouchUpInside(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
