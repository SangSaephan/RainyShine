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
            let result = response.result.value
            print(result!)
        }
    }
}
