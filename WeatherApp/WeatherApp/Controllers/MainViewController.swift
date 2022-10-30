//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Y. Yılmaz Erdoğmuş on 29.10.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        setupUI()
    }
    
    func  setupUI(){
        
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Weather"
        titleLabel.textColor = .blue
        titleLabel.font = UIFont(name: "Georgia-Bold", size: 56)!
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(72)
//            make.leading.equalToSuperview().offset(72)
            make.centerX.equalToSuperview()
        }
    }
    
}
