//
//  City.swift
//  WeatherApp
//
//  Created by 岡田暁 on 2017-09-21.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit


class City{

    var name: String
    var weather:Weather
    
    init(_ weather: Weather,  _ name:String) {
        self.name = name
        self.weather = weather
        
    }
    
    
    
}

enum Weather{
    
    case clearday, clearnight, sunny, snow, wind, cloudy, cloudynight, rain
    
}

class WeatherClass{
    var wname: String = "default"
    var wcolor: UIColor = UIColor.blue
    var wimage: UIImage = #imageLiteral(resourceName: "default")
    
    func setWeather(weather:Weather){
        
        switch weather {
        case .clearday:
            wname = "clearday"
            wcolor = UIColor.cyan
            wimage = #imageLiteral(resourceName: "clearday")
        case .clearnight:
            wname = "clearnight"
            wcolor = UIColor.blue
            wimage = #imageLiteral(resourceName: "clearnight")
        case .sunny:
            wname = "Sunny"
            wcolor = UIColor.orange
            wimage = #imageLiteral(resourceName: "sunny")
        case .snow:
            wname = "Snowy"
            wcolor = UIColor.lightGray
            wimage = #imageLiteral(resourceName: "snow")
        case .wind:
            wname = "wind"
            wcolor = UIColor.darkGray
            wimage = #imageLiteral(resourceName: "wind")
        case .rain:
            wname = "rain"
            wcolor = UIColor.blue
            wimage = #imageLiteral(resourceName: "rain")
        case .cloudy:
            wname = "cloudy"
            wcolor = UIColor.cyan
            wimage = #imageLiteral(resourceName: "cloudy")
        case .cloudynight:
            wname = "cloudynight"
            wcolor = UIColor.lightGray
            wimage = #imageLiteral(resourceName: "cloudynight")
        default:
            wname = "Default"
            wcolor = UIColor.orange
            wimage = #imageLiteral(resourceName: "default")
            
        }
    
    }


}
