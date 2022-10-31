//
//  FrankfurtViewController.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 30.10.2022.
//

import UIKit
import SnapKit

class FrankfurtViewController: UIViewController {
    
    let api = "6f4cc2ce27784b97dc8e4605463f1079"
    let lat = ""
    let lon = ""
    
    let currentTemp = UILabel()
    let feelsLikeTemp = UILabel()
    let humidityTemp = UILabel()
    let pressureTemp = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.92, green: 0.90, blue: 0.79, alpha: 1.00)

        createSuitSegmentedControl()

        setupUI()
    }
    
    func createSuitSegmentedControl(){
            let items = ["Celsius", "Kelvin"]
            let segmentedControl = UISegmentedControl(items: items)
            segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
            segmentedControl.translatesAutoresizingMaskIntoConstraints = false

            view.addSubview(segmentedControl)

        segmentedControl.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(160)
            make.width.equalTo(144)
            make.centerX.equalToSuperview()
        }
        }

        @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
            switch segmentedControl.selectedSegmentIndex{
            case 0:
                view.backgroundColor = .white

            case 1:
                view.backgroundColor = .gray

            default:
                view.backgroundColor = .yellow
            }
        }
    
    func  setupUI(){
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Frankfurt"
        titleLabel.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 48)!
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(84)
            make.centerX.equalToSuperview()
        }
        
        let houseButton = UIButton()
        view.addSubview(houseButton)
        houseButton.setImage(UIImage(named: "Back"), for: .normal)
        houseButton.addTarget(self, action: #selector(houseButtonClicked), for: .touchUpInside)
        houseButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.leading.equalToSuperview().offset(24)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        let refreshButton = UIButton()
        view.addSubview(refreshButton)
        refreshButton.setImage(UIImage(named: "Reload"), for: .normal)
        refreshButton.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
        refreshButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        let frankfurtImage = UIImageView()
        view.addSubview(frankfurtImage)
        frankfurtImage.image = UIImage(named: "Frankfurt")
        frankfurtImage.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(-24)
            make.width.equalTo(640)
            make.height.equalTo(420)
        }
        
        view.addSubview(currentTemp)
        currentTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        currentTemp.font = UIFont(name: "Georgia-Bold", size: 96)!
        currentTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(200)
            make.centerX.equalToSuperview()
        }
        
        let feelsLikeLabel = UILabel()
        view.addSubview(feelsLikeLabel)
        feelsLikeLabel.text = "Feels Like"
        feelsLikeLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        feelsLikeLabel.font = UIFont(name: "Georgia-Bold", size: 16)!
        feelsLikeLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(332)
            make.leading.equalToSuperview().offset(72)
        }
        
        view.addSubview(feelsLikeTemp)
        feelsLikeTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        feelsLikeTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        feelsLikeTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(332)
            make.trailing.equalToSuperview().offset(-80)
        }
        
        let humidityLabel = UILabel()
        view.addSubview(humidityLabel)
        humidityLabel.text = "Humidity"
        humidityLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        humidityLabel.font = UIFont(name: "Georgia-Bold", size: 16)!
        humidityLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(364)
            make.leading.equalToSuperview().offset(72)
        }
        
        view.addSubview(humidityTemp)
        humidityTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        humidityTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        humidityTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(360)
            make.trailing.equalToSuperview().offset(-80)
        }
        
        let pressureLabel = UILabel()
        view.addSubview(pressureLabel)
        pressureLabel.text = "Pressure"
        pressureLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        pressureLabel.font = UIFont(name: "Georgia-Bold", size: 16)!
        pressureLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(396)
            make.leading.equalToSuperview().offset(72)
        }
        
        view.addSubview(pressureTemp)
        pressureTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        pressureTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        pressureTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(392)
            make.trailing.equalToSuperview().offset(-72)
        }
        
    }
    
    @objc func houseButtonClicked(){
        let rootVC = MainViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
        
    }
    
    @objc func refreshButtonClicked(){
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(api)")
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
