//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let newyork = City(Weather.clearday, "newyork")
        let tokyo = City(Weather.cloudynight, "tokyo")
        let amsterdam = City(Weather.rain, "amsterdam")
        let sydney = City(Weather.cloudy, "sydney")
        
        let city1  = CityView(newyork, .featured)
        let city2  = CityView(tokyo, .featured)
        let city3  = CityView(amsterdam, .featured)
        let city4  = CityView(sydney, .featured)
        let tabBarController = UITabBarController()
        let baseControllers = [city1.controller, city2.controller, city3.controller, city4.controller]
        tabBarController.viewControllers = baseControllers.map{UINavigationController(rootViewController: $0) }
        
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }


}

class CityView{

    var city: City
    var controller: CityViewController
    
    init(_ city: City, _ icon: UITabBarSystemItem) {
        let count = 0
        self.city = city        
        let weather = WeatherClass()
        weather.setWeather(weather: city.weather)
        controller =  CityViewController(city: city, weather: weather)
        controller.title =  city.name
        
        controller.view.backgroundColor = weather.wcolor
        controller.tabBarItem = UITabBarItem(title: city.name, image:  UIImage(named: city.name), tag: count)
        
        
    }

}
