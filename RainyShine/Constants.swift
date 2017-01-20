//
//  Constants.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/19/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import Foundation

let baseUrl = "http://api.openweathermap.org/data/2.5/weather?"
let latitude = "lat="
let longitude = "&lon="
let appId = "&appid="
let apiKey = "cc1eb346585f997e112a8041477bf38e"

typealias DownloadComplete = () -> Void

let currentWeatherUrl = "\(baseUrl)\(latitude)37.8044\(longitude)-122.2711\(appId)\(apiKey)"
