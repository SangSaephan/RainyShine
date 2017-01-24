//
//  WeatherCell.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/24/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    
    func configureCell(forecast: Forecast) {
        dayLabel.text = forecast.date
        forecastLabel.text = forecast.condition
        highTempLabel.text = "\(forecast.maxTemp)°"
        lowTempLabel.text = "\(forecast.minTemp)°"
        weatherImageView.image = UIImage(named: forecast.condition)
    }

}
