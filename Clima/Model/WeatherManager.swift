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
        performRequest(urlString: stringURL)
    }
    
    func performRequest(urlString: String) {
        //1. create URL
        if let url = URL(string: urlString) {
            //2. create URLSession
            let session = URLSession(configuration: .default)
            //3. Give the url a task
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }
            //4. start the task
            task.resume()
        }
    }
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
        let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
}
