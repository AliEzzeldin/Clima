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
            let task = session.dataTask(with: url, completionHandler: handle(data: response: error: ))
            //4. start the task
            task.resume()
        }
    }
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
}
