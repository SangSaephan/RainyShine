//
//  CurrentWeather.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/19/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeather {
    private var _cityName: String?
    private var _date: String?
    private var _weatherType: String?
    private var _currentTemp: Int?
    
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        
        return _cityName!
    }
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        
        let currentDate = dateFormatter.string(from: Date())
        self._date = currentDate
        
        return _date!
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        
        return _weatherType!
    }
    
    var currentTemp: Int {
        if _currentTemp == nil {
            _currentTemp = 0
        }
        
        return _currentTemp!
    }
    
    // Download weather details from API
    func downloadWeatherDetails(completed: @escaping DownloadComplete) {
        let currentUrl = URL(string: currentWeatherUrl)!
        
        Alamofire.request(currentUrl).responseJSON { response in
            let result = response.result
            if let dictionary = result.value as? Dictionary<String, Any> {
                if let city = dictionary["name"] as? String {
                    self._cityName = city.capitalized
                }
                
                if let weather = dictionary["weather"] as? [Dictionary<String, Any>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                    }
                }
                
                if let temperature = dictionary["main"] as? Dictionary<String, Any> {
                    if let temp = temperature["temp"] as? Double {
                        // Convert temperature to fahrenheit from kelvin
                        let fahrenheit = temp * (9/5) - 459.67
                        self._currentTemp = Int(round(fahrenheit))
                    }
                }
            }
            completed()
        }
    }
}
