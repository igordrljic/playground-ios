//
//  PushNotificationNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

class PushNotificationNavigator {
    static let shared = PushNotificationNavigator()
    private init() {}
    func navigateToCityDetails(cities: [String], index: Int) {
        MainNavigator.shared.showSearch()
        MainNavigator.shared.searchNavigator.showCityList(cities: cities,
                                                          animated: false,
                                                          completion: {})
        MainNavigator.shared.searchNavigator.cityListNavigator.showDetails(for: cities[index],
                                                                           animated: false,
                                                                           completion: {})
    }
}
