//
//  SearchNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

import UIKit

class SearchNavigator {
    let searchViewController = SearchViewController()
    
    let cityListNavigator = CityListNavigator()
    
    init() {
        searchViewController.navigationDelegate = self
    }
}

extension SearchNavigator: SearchNavigationDelegate {
    func showCityList(cities: [String], animated: Bool, completion: @escaping () -> Void) {
        let viewController = cityListNavigator.cityListViewController
        let navigationController = UINavigationController(rootViewController: viewController)
        viewController.cities = cities
        viewController.navigationItem.title = "City list"
        searchViewController.present(navigationController, animated: animated, completion: completion)
    }
}
