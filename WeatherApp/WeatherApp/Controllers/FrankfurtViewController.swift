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
    let lat = "50.11089040289464"
    let lon = "8.672883151638299"
    
    let currentTemp = UILabel()
    let feelsLikeTemp = UILabel()
    let humidityTemp = UILabel()
    let pressureTemp = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.92, green: 0.90, blue: 0.79, alpha: 1.00)

//        createSuitSegmentedControl()

        setupUI()
    }
    
//    func createSuitSegmentedControl(){
//            let items = ["beyaz", "gri"]
//            let segmentedControl = UISegmentedControl(items: items)
//            segmentedControl.addTarget(self, action: #selector(suitDidChange(_:)), for: .valueChanged)
//            segmentedControl.translatesAutoresizingMaskIntoConstraints = false
//
//            view.addSubview(segmentedControl)
//
//        segmentedControl.snp.makeConstraints{ make in
//            make.bottom.equalToSuperview().offset(-400)
//            //            make.leading.equalToSuperview().offset(72)
//            make.width.equalTo(144)
//            make.centerX.equalToSuperview()
//        }
//        }
//
//        @objc func suitDidChange(_ segmentedControl: UISegmentedControl) {
//            switch segmentedControl.selectedSegmentIndex{
//            case 0:
//                view.backgroundColor = .white
//
//            case 1:
//                view.backgroundColor = .gray
//
//            default:
//                view.backgroundColor = .yellow
//            }
//        }
    
    func  setupUI(){
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Frankfurt"
        titleLabel.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 48)!
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.centerX.equalToSuperview()
        }
        
        let refreshButton = UIButton()
        view.addSubview(refreshButton)
        refreshButton.setTitle("Refresh", for: UIControl.State.normal)
        refreshButton.layer.cornerRadius = 10
        refreshButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 24)!
        refreshButton.setTitleColor(.white, for: UIControl.State.normal)
        refreshButton.backgroundColor = .blue
        refreshButton.addTarget(self, action: #selector(refreshButtonClicked), for: .touchUpInside)
        refreshButton.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-144)
            //            make.leading.equalToSuperview().offset(72)
            make.width.equalTo(144)
            make.centerX.equalToSuperview()
        }
        
//        let galataImage = UIImageView()
//        view.addSubview(galataImage)
//        galataImage.image = UIImage(named: "GalataTower")
//        galataImage.snp.makeConstraints{ make in
//            make.bottom.equalToSuperview()
//            make.leading.equalToSuperview()
//            make.width.equalTo(144)
//            make.height.equalTo(288)
//        }
        
        let currentWeatherLabel = UILabel()
        view.addSubview(currentWeatherLabel)
        currentWeatherLabel.text = "Current Weather"
        currentWeatherLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        currentWeatherLabel.font = UIFont(name: "Georgia-Bold", size: 24)!
        currentWeatherLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(216)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(currentTemp)
        currentTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        currentTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        currentTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(216)
            make.trailing.equalToSuperview().offset(-72)
        }
        
        let feelsLikeLabel = UILabel()
        view.addSubview(feelsLikeLabel)
        feelsLikeLabel.text = "Feels Like"
        feelsLikeLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        feelsLikeLabel.font = UIFont(name: "Georgia-Bold", size: 24)!
        feelsLikeLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(288)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(feelsLikeTemp)
        feelsLikeTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        feelsLikeTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        feelsLikeTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(288)
            make.trailing.equalToSuperview().offset(-72)
        }
        
        let humidityLabel = UILabel()
        view.addSubview(humidityLabel)
        humidityLabel.text = "Humidity"
        humidityLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        humidityLabel.font = UIFont(name: "Georgia-Bold", size: 24)!
        humidityLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(360)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(humidityTemp)
        humidityTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        humidityTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        humidityTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(360)
            make.trailing.equalToSuperview().offset(-72)
        }
        
        let pressureLabel = UILabel()
        view.addSubview(pressureLabel)
        pressureLabel.text = "Pressure"
        pressureLabel.textColor = UIColor(red: 0.14, green: 0.20, blue: 0.28, alpha: 1.00)
        pressureLabel.font = UIFont(name: "Georgia-Bold", size: 24)!
        pressureLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(432)
            make.leading.equalToSuperview().offset(24)
        }
        
        view.addSubview(pressureTemp)
        pressureTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        pressureTemp.font = UIFont(name: "Georgia-Bold", size: 24)!
        pressureTemp.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(432)
            make.trailing.equalToSuperview().offset(-72)
        }
        
        
        //        let tabBarController = UITabBarController()
        //        let vc1 = MainViewController()
        //        let vc2 = AnkaraViewController()
        //        let vc3 = SanFranciscoViewController()
        //        let vc4 = FrankfurtViewController()
        //        let vc5 = ShanghaiViewController()
        //
        //        vc1.title = "İstanbul"
        //        vc2.title = "Ankara"
        //        vc3.title = "San Francisco"
        //        vc4.title = "Frankfurt"
        //        vc5.title = "Shanghai"
        //
        //        tabBarController.setViewControllers([vc1, vc2, vc3, vc4, vc5], animated: false)
        //
        //        guard let items = tabBarController.tabBar.items else {return}
        //
        //        let images = ["house", "star", "bell", "person.circle", "gear"]
        //
        //        for x in 0...4{
        //            items[x].image = UIImage(systemName: images[x])
        //        }
        //
        //        tabBarController.modalPresentationStyle = .fullScreen
        //        present(tabBarController, animated: true)
        //    }
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
                                    self.currentTemp.text = String(temp)
                                }
                                if let feelsLike = main["feels_like"] as? Double{
                                    self.feelsLikeTemp.text = String(feelsLike)
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
