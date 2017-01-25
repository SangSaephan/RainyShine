//
//  Constants.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/19/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import Foundation

let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat=\(Location.sharedInstance.latitude!)"
let longitude = "&lon=\(Location.sharedInstance.longitude!)"
let appId = "&appid="
let apiKey = "cc1eb346585f997e112a8041477bf38e"

typealias DownloadComplete = () -> Void

let currentWeatherUrl = "\(baseUrl)\(latitude)\(longitude)\(appId)\(apiKey)"
let forecastUrl = "http://api.openweathermap.org/data/2.5/forecast/daily?\(latitude)\(longitude)&cnt=10&mode=json&appid=cc1eb346585f997e112a8041477bf38e"
