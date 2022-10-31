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
    
    var citiesCollection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())

    
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
        
        let logoImage = UIImageView()
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "Logo")
        logoImage.snp.makeConstraints{ make in
            make.bottom.equalToSuperview().offset(-64)
            make.width.equalTo(200)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        let flowLayout = UICollectionViewFlowLayout()
              flowLayout.scrollDirection = .vertical
        flowLayout.itemSize = CGSize(width: 1.0 * UIScreen.main.bounds.width, height: 0.1 * UIScreen.main.bounds.height)
              flowLayout.minimumLineSpacing = 0.01 * UIScreen.main.bounds.width

              citiesCollection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
              citiesCollection.register(CitiesCell.self, forCellWithReuseIdentifier: "citiesCell")
              citiesCollection.delegate = self
              citiesCollection.dataSource = self
              citiesCollection.backgroundColor = .clear
              citiesCollection.showsVerticalScrollIndicator = false
              view.addSubview(citiesCollection)
        
        citiesCollection.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.bottom.left.right.equalToSuperview()
        }
        
    }
    
}

extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = citiesCollection.dequeueReusableCell(withReuseIdentifier: "citiesCell", for: indexPath) as! CitiesCell
        cell.cityName.text = cities[indexPath.row].cityName
        cell.cityName.textAlignment = .center
        cell.cityName.font = UIFont(name: "Georgia-Bold", size: 40)!
        cell.cityName.textColor = UIColor(red: 0.14, green: 0.22, blue: 0.28, alpha: 1.00)
        cell.cityName.frame = CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height)
        cell.cityName.backgroundColor = UIColor(red: 0.56, green: 0.69, blue: 0.77, alpha: 1.00)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        DatabaseHandler.shared.refreshButtonClicked(selectedCity: cities[indexPath.row], completion: { selectedCity in
            let destVC = DetailViewController()
            destVC.city = selectedCity
            destVC.modalPresentationStyle = .fullScreen
            self.present(destVC, animated: true)
        })
    }
}
