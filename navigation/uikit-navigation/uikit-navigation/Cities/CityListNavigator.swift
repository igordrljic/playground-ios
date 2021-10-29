//
//  CityListNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

import UIKit

class CityListNavigator {
    let cityListViewController: CityListViewController
    
    init() {
        cityListViewController = CityListViewController()
        cityListViewController.navigationDelegate = self
    }
}

extension CityListNavigator: CityListNavigationDelegate {
    func showDetails(for city: String, animated: Bool, completion: @escaping () -> Void) {
        let cityDetailsViewController = CityDetailsViewController()
        cityDetailsViewController.city = city
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        cityListViewController.navigationController?.pushViewController(cityDetailsViewController,
                                                                        animated: animated)
        CATransaction.commit()
    }
}
