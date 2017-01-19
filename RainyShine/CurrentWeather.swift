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
    private var _currentTemp: Double?
    
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
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        
        return _currentTemp!
    }
    
    // Download weather details from API
    func downloadWeatherDetails(completed: DownloadComplete) {
        let currentUrl = URL(string: currentWeatherUrl)
        
        Alamofire.request(currentUrl!).responseJSON { response in
            if let result = response.result.value as? NSDictionary {
                if let city = result["name"] as? String {
                    self._cityName = city.capitalized
                    print(self.cityName)
                }
                
                if let weather = result["weather"] as? [NSDictionary] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                        print(self.weatherType)
                    }
                }
                
                if let temperature = result["main"] as? NSDictionary {
                    if let temp = temperature["temp"] as? Double {
                        let fahrenheit = temp * (9/5) - 459.67
                        self._currentTemp = fahrenheit
                        print(Int(round(self.currentTemp)))
                    }
                }
            }
        }
    }
}
