//
//  NetworkLayer.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 31.10.2022.
//

import UIKit

class DatabaseHandler {
    static let shared = DatabaseHandler()
    let api = "6f4cc2ce27784b97dc8e4605463f1079"
        
    func refreshButtonClicked(selectedCity: City){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(selectedCity.lat)&lon=\()&appid=\(api)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil{
                print("Error")
            }else{
                if data != nil{
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
                        
                        DispatchQueue.main.async {
                            if let main = jsonResponse!["main"] as? [String: Any]{
                                if let temp = main["temp"] as? Double{
                                    self.currentTemp.text = "\(String(Int(temp-273.15)))°C"
                                }
                                if let feelsLike = main["feels_like"] as? Double{
                                    self.feelsLikeTemp.text = String(Int(feelsLike-273.15))
                                }
                                if let humidity = main["humidity"] as? Double{
                                    self.humidityTemp.text = String(humidity)
                                }
                                if let pressure = main["pressure"] as? Double{
                                    self.pressureTemp.text = String(pressure)
                                }
                            }
                        }
                        
                    }catch{
                        
                    }
                }
            }
        }
        task.resume()
    }
}
