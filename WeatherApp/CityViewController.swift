//
//  ViewController.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class CityViewController: UIViewController{
    
    var city: City?
    var weather: WeatherClass?
    
    convenience init(city: City, weather: WeatherClass) {
        self.init(nibName: nil, bundle: nil)
        self.city = city
        self.weather = weather
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button: UIButton = UIButton(frame: CGRect(x: view.bounds.width / 2-45, y: view.bounds.height/2, width: 100, height: 50))
        
        button.backgroundColor = UIColor.white
        button.setTitle("Detail", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self,action: #selector(showWeatherDetails), for: .touchUpInside)
        view.addSubview(button)
        
        
        let textCity = UILabel(frame: .zero)
        
        textCity.font = UIFont.boldSystemFont(ofSize: 30)
        textCity.text = city?.name
        textCity.textAlignment = .center
        

        self.view.addSubview(textCity)
        
        textCity.translatesAutoresizingMaskIntoConstraints = false
        textCity.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        textCity.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        
        let iconView = UIImageView(image: weather?.wimage)
        
        self.view.addSubview(iconView)
        
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        iconView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
    }
    
    func showWeatherDetails(){
        let newVC = DetailedViewController()
        newVC.view.backgroundColor = view.backgroundColor
        self.navigationController?.pushViewController(newVC, animated: true)
    }



}

