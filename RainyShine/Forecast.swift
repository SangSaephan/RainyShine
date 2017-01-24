//
//  Forecast.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import UIKit

class Forecast {
    private var _date: String!
    private var _condition: String!
    private var _minTemp: String!
    private var _maxTemp: String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        
        return _date
    }
    
    var condition: String {
        if _condition == nil {
            _condition = ""
        }
        
        return _condition
    }
    
    var minTemp: String {
        if _minTemp == nil {
            _minTemp = ""
        }
        
        return _minTemp
    }
    
    var maxTemp: String {
        if _maxTemp == nil {
            _maxTemp = ""
        }
        
        return _maxTemp
    }
    
    init(weatherDict: Dictionary<String, Any>) {
        
        // Parse the minimum and maximum temperature
        if let temp = weatherDict["temp"] as? Dictionary<String, Any> {
            if let min = temp["min"] as? Double {
                // Convert temperature to fahrenheit from kelvin
                let fahrenheit = min * (9/5) - 459.67
                self._minTemp = "\(Int(round(fahrenheit)))"
            }
            
            if let max = temp["max"] as? Double {
                // Convert temperature to fahrenheit from kelvin
                let fahrenheit = max * (9/5) - 459.67
                self._maxTemp = "\(Int(round(fahrenheit)))"
            }
        }
        
        // Parse the weather condition
        if let weather = weatherDict["weather"] as? [Dictionary<String, Any>] {
            if let main = weather[0]["main"] as? String {
                self._condition = main
            }
        }
        
        // Parse the days of the week
        if let date = weatherDict["dt"] as? Double {
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfWeek()
        }
    }
    
}

// Format the date
extension Date {
    func dayOfWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
