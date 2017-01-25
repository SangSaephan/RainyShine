//
//  Location.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
