//
//  SearchViewController.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

import UIKit

class SearchViewController: UIViewController {
    let showCitiesButton = UIButton()
    weak var navigationDelegate: SearchNavigationDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setViews()
        setConstraints()
    }
    
    func setViews() {
        view.addSubview(showCitiesButton)
        showCitiesButton.translatesAutoresizingMaskIntoConstraints = false
        showCitiesButton.setTitle("Show city list", for: .normal)
        showCitiesButton.addTarget(self,
                                   action: #selector(showCitiesButtonAction),
                                   for: .touchUpInside)
    }
    
    func setConstraints() {
        [showCitiesButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
         showCitiesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)]
            .forEach {
                $0.isActive = true
            }
    }
    
    @objc private func showCitiesButtonAction() {
        let cities = ["Belgrade", "Budapest", "Novi Sad", "Sarajevo", "Kopar", "Izola"]
        navigationDelegate.showCityList(cities: cities, animated: true, completion: {})
    }
}
