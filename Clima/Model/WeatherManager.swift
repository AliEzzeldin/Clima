//
//  WeatherManager.swift
//  Clima
//
//  Created by Ali Ezzeldin on 2021-08-04.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=eebb9ca8e1c2288ab97d866bd0926793&units=metric"
    
    func fetchWeather(cityName: String) {
        let stringURL = "\(weatherURL)&q=\(cityName)"
        print(stringURL)
    }
}
