//
//  SearchNavigationDelegate.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

protocol SearchNavigationDelegate: AnyObject {
    func showCityList(cities: [City], animated: Bool, completion: @escaping () -> Void)
}
