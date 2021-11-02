//
//  RootNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 2.11.21..
//

import UIKit

class RootNavigator {
    static let shared = RootNavigator()
    var window: UIWindow?
    private (set) var mainNavigator = MainNavigator()
    
    private init() {}
    
    func navigate(for action: PushNavigationAction) {
        switch action {
        case let .navigateToCityDetails(cities, cityId):
            navigateToCityDetails(cities: cities, id: cityId)
        }
    }
    
    func navigateToLoader() {
        window?.rootViewController = LoaderViewController()
    }
    
    func navigateToMain() {
        window?.rootViewController = mainNavigator.mainViewController
    }
    
    private func navigateToCityDetails(cities: [City], id: CityID) {
        guard let city = cities.first(where: { $0.id == id }) else {
            return
        }
        navigateToMain()
        mainNavigator.showSearch()
        mainNavigator.searchNavigator.showCityList(cities: cities,
                                                   animated: false,
                                                   completion: {})
        mainNavigator.searchNavigator.cityListNavigator.showDetails(for: city,
                                                                    animated: false,
                                                                    completion: {})
    }
}
