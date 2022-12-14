//
//  IstanbulViewController.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 31.10.2022.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    let currentTemp = UILabel()
    let feelsLikeTemp = UILabel()
    let humidityTemp = UILabel()
    let pressureTemp = UILabel()
    var city = City()
    var segmentedControl = UISegmentedControl()
    var selectedCityImageName: String {
        return "\(city.cityName!)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.92, green: 0.90, blue: 0.79, alpha: 1.00)
        
        createSuitSegmentedControl()
        
        setupUI()
    }
    
    func createSuitSegmentedControl(){
        let items = ["Celsius", "Kelvin"]
        segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
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
            currentTemp.text = "\(Int(Double(city.temp!)! - 272.0))"
            feelsLikeTemp.text = "\(city.feelsLike!)"
        case 1:
            currentTemp.text = "\(city.temp!)"
            feelsLikeTemp.text = "\(Int(city.feelsLike!)! + 272)"
        default:
            break
        }
    }
    
    func  setupUI(){
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = city.cityName
        titleLabel.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 40)!
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
        refreshButton.addTarget(self, action: #selector(refreshBtnTapped), for: .touchUpInside)
        refreshButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().offset(-24)
            make.width.equalTo(24)
            make.height.equalTo(24)
        }
        
        let galataImage = UIImageView()
        view.addSubview(galataImage)
        galataImage.contentMode = .scaleAspectFill
        galataImage.image = UIImage(named: selectedCityImageName)
        galataImage.snp.makeConstraints{ make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        view.addSubview(currentTemp)
        currentTemp.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        currentTemp.font = UIFont(name: "Georgia-Bold", size: 96)!
        currentTemp.text = "\(Int(Double(city.temp!)! - 272.0))"
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
        feelsLikeTemp.text = city.feelsLike
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
        humidityTemp.text = city.humidity
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
        pressureTemp.text = city.pressure
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
    
    @objc func refreshBtnTapped(){
        segmentedControl.selectedSegmentIndex = 0
        DatabaseHandler.shared.refreshButtonClicked(selectedCity: city) { city in
            self.currentTemp.text = "\(Int(Double(city.temp!)! - 272.0))"
            self.pressureTemp.text = city.pressure
            self.humidityTemp.text = city.humidity
            self.feelsLikeTemp.text = city.feelsLike
        }
        
        
    }
    
    
    
}
