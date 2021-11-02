//
//  CityDetailsViewController.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

import UIKit

class CityDetailsViewController: UIViewController {
    var city: City! {
        didSet {
            cityLabel.text = city.name
        }
    }
    
    let cityLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
    }
    
    func setViews() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(cityLabel)
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setConstraints() {
        [cityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
            .forEach {
                $0.isActive = true
            }
    }
}
