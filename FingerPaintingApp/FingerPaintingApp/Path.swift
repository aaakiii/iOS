//
//  Path.swift
//  FingerPaintingApp
//
//  Created by 岡田暁 on 2017-09-24.
//  Copyright © 2017 岡田暁. All rights reserved.
//

import Foundation
import UIKit

class Path {

    var points: [CGPoint] = []
    let  color: UIColor
    init(color: UIColor) {
        self.color = color
    }
    
    func add(point: CGPoint){
        points.append(point)
    }

}
