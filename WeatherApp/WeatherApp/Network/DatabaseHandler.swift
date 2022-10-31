//
//  NetworkLayer.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 31.10.2022.
//

import UIKit

class DatabaseHandler {
    static let shared = DatabaseHandler()
        
    func refreshButtonClicked(selectedCity: City, completion: @escaping (City) -> ()){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(selectedCity.lat!)&lon=\(selectedCity.lon!)&appid=6f4cc2ce27784b97dc8e4605463f1079")
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
                                    if let feelsLike = main["feels_like"] as? Double{
                                        if let humidity = main["humidity"] as? Double{
                                            if let pressure = main["pressure"] as? Double{
                                                selectedCity.feelsLike = String(Int(feelsLike-273.15))
                                                selectedCity.humidity = String(humidity)
                                                selectedCity.pressure = String(pressure)
                                                    selectedCity.temp = String(temp)
                                                completion(selectedCity)
                                                }
                                        }
                                    }
                                    //self.currentTemp.text = "\(String(Int(temp-273.15)))°C"
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
