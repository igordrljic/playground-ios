//
//  PushNotificationNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

class PushNotificationNavigator {
    static let shared = PushNotificationNavigator()
    private init() {}
    func navigateToCityDetails(cities: [City], id: CityID) {
        guard let city = cities.first(where: { $0.id == id }) else {
            return
        }
        let mainNavigator = MainNavigator.shared
        mainNavigator.showSearch()
        mainNavigator.searchNavigator.showCityList(cities: cities,
                                                   animated: false,
                                                   completion: {})
        mainNavigator.searchNavigator.cityListNavigator.showDetails(for: city,
                                                                    animated: false,
                                                                    completion: {})
    }
}
