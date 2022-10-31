//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 29.10.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let api = "6f4cc2ce27784b97dc8e4605463f1079"
    let lat = "41.10795624437255"
    let lon = "29.032269082641236"
    
    let currentTemp = UILabel()
    let feelsLikeTemp = UILabel()
    let humidityTemp = UILabel()
    let pressureTemp = UILabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 0.92, green: 0.90, blue: 0.79, alpha: 1.00)


        setupUI()
    }
    
    func  setupUI(){
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Weathy"
        titleLabel.textColor = UIColor(red: 0.92, green: 0.33, blue: 0.31, alpha: 1.00)
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 48)!
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(88)
            make.centerX.equalToSuperview()
        }
        
        let istanbulButton = UIButton()
        view.addSubview(istanbulButton)
        istanbulButton.setTitle("İstanbul", for: UIControl.State.normal)
        istanbulButton.layer.cornerRadius = 10
        istanbulButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 32)!
        istanbulButton.setTitleColor(.white, for: UIControl.State.normal)
        istanbulButton.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        istanbulButton.addTarget(self, action: #selector(istanbulButtonClicked), for: .touchUpInside)
        istanbulButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(200)
            make.width.equalTo(480)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        let ankaraButton = UIButton()
        view.addSubview(ankaraButton)
        ankaraButton.setTitle("Ankara", for: UIControl.State.normal)
        ankaraButton.layer.cornerRadius = 10
        ankaraButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 32)!
        ankaraButton.setTitleColor(.white, for: UIControl.State.normal)
        ankaraButton.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        ankaraButton.addTarget(self, action: #selector(ankaraButtonClicked), for: .touchUpInside)
        ankaraButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(300)
            make.width.equalTo(480)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        let sanFranciscoButton = UIButton()
        view.addSubview(sanFranciscoButton)
        sanFranciscoButton.setTitle("San Francisco", for: UIControl.State.normal)
        sanFranciscoButton.layer.cornerRadius = 10
        sanFranciscoButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 32)!
        sanFranciscoButton.setTitleColor(.white, for: UIControl.State.normal)
        sanFranciscoButton.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        sanFranciscoButton.addTarget(self, action: #selector(sanFranciscoButtonClicked), for: .touchUpInside)
        sanFranciscoButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(400)
            make.width.equalTo(480)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        let frankfurtButton = UIButton()
        view.addSubview(frankfurtButton)
        frankfurtButton.setTitle("Frankfurt", for: UIControl.State.normal)
        frankfurtButton.layer.cornerRadius = 10
        frankfurtButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 32)!
        frankfurtButton.setTitleColor(.white, for: UIControl.State.normal)
        frankfurtButton.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        frankfurtButton.addTarget(self, action: #selector(frankfurtButtonClicked), for: .touchUpInside)
        frankfurtButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(500)
            make.width.equalTo(480)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        let shanghaiButton = UIButton()
        view.addSubview(shanghaiButton)
        shanghaiButton.setTitle("Shanghai", for: UIControl.State.normal)
        shanghaiButton.layer.cornerRadius = 10
        shanghaiButton.titleLabel!.font = UIFont(name: "Georgia-Bold", size: 32)!
        shanghaiButton.setTitleColor(.white, for: UIControl.State.normal)
        shanghaiButton.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        shanghaiButton.addTarget(self, action: #selector(shanghaiButtonClicked), for: .touchUpInside)
        shanghaiButton.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(600)
            make.width.equalTo(480)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
    }
    
    
    @objc func istanbulButtonClicked(){
        let rootVC = IstanbulViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func ankaraButtonClicked(){
        let rootVC = AnkaraViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func sanFranciscoButtonClicked(){
        let rootVC = SanFranciscoViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
    @objc func frankfurtButtonClicked(){
        let rootVC = FrankfurtViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
   
    @objc func shanghaiButtonClicked(){
        let rootVC = ShanghaiViewController()
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: true)
    }
    
}
