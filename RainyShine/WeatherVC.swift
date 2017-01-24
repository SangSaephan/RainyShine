//
//  ViewController.swift
//  RainyShine
//
//  Created by Sang Saephan on 1/17/17.
//  Copyright © 2017 Sang Saephan. All rights reserved.
//

import UIKit
import Alamofire

class WeatherVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var currentWeather: CurrentWeather!
    var forecast: Forecast!
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        currentWeather = CurrentWeather()
        currentWeather.downloadWeatherDetails {
            self.downloadForecastDetails {
                self.updateCurrentWeather()
            }
        }
        
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        let forecast = forecasts[indexPath.row]
        cell.configureCell(forecast: forecast)
        
        return cell
    }
    
    // Download weather data for the next 9 days
    func downloadForecastDetails(completed: @escaping DownloadComplete) {
        let forecast = URL(string: forecastUrl)!
        
        Alamofire.request(forecast).responseJSON { response in
            let result = response.result
            
            if let dictionary = result.value as? Dictionary<String, Any> {
                
                if let list = dictionary["list"] as? [Dictionary<String, Any>] {
                    for object in list {
                        let forecast = Forecast(weatherDict: object)
                        self.forecasts.append(forecast)
                    }
                    self.forecasts.remove(at: 0)
                    self.tableView.reloadData()
                }
            }
            completed()
        }
    }

    // Update UI for current weather
    func updateCurrentWeather() {
        dateLabel.text = currentWeather.date
        temperatureLabel.text = "\(currentWeather.currentTemp)°"
        locationLabel.text = currentWeather.cityName
        conditionLabel.text = currentWeather.weatherType
        weatherImageView.image = UIImage(named: currentWeather.weatherType)
    }

}

