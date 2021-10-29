//
//  CityListNavigationDelegate.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

protocol CityListNavigationDelegate: AnyObject {
    func showDetails(for city: String, animated: Bool, completion: @escaping () -> Void)
}
