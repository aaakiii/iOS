//
//  TabBarController.swift
//  WeatherApp
//
//  Created by 岡田暁 on 2017-09-21.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabs()
    }
    
    
    func setTabs(){
        let tab1 = UIViewController()
        let tab2 = UIViewController()
        let tab3 = UIViewController()
        let tab4 = UIViewController()
        
        tab1.view.backgroundColor = .red
        tab2.view.backgroundColor = .yellow
        tab3.view.backgroundColor = .green
        tab4.view.backgroundColor = .white
    
        tab1.tabBarItem = UITabBarItem(title: "tab1", image: UIImage(named: "default"), tag: 1)
        tab2.tabBarItem = UITabBarItem(title: "tab2", image: UIImage(named:"default"), tag: 2)
        tab3.tabBarItem = UITabBarItem(title: "tab3", image: UIImage(named:"default"), tag: 3)
        tab4.tabBarItem = UITabBarItem(title: "tab4", image: UIImage(named:"default"), tag: 4)
        
        let nav1 = UINavigationController(rootViewController: tab1)
        let nav2 = UINavigationController(rootViewController: tab2)
        let nav3 = UINavigationController(rootViewController: tab3)
        let nav4 = UINavigationController(rootViewController: tab4)
        
        
        self.viewControllers = [nav1, nav2, nav3, nav4]
    }



}
