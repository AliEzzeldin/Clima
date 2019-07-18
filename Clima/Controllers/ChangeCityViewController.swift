//
//  ChangeCityViewController.swift
//  Clima
//
//  Created by Ali on 2019-05-29.
//  Copyright © 2019 Ali Mostafa. All rights reserved.
//

import UIKit

//MARK: - Protocol Declaration :

protocol ChangeCityDelegate {
    func userEnteredANewCityName(city: String)
}

//MARK: - Class Declaration
class ChangeCityViewController: UIViewController {

    //MARK: - Instance Variables
    var delegate : ChangeCityDelegate?
    
    //MARK: - IBOutlet to the text field:
    @IBOutlet weak var changeCityTextField: UITextField!
    
    //MARK: - IBAction getWeatherPressed
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let cityName = changeCityTextField.text!
        
        delegate?.userEnteredANewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    //MARK: - Back to WeatherVC
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

}
