//
//  PushNotificationNavigator.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 29.10.21..
//

class PushNotificationManager {
    static let shared = PushNotificationManager(cityService: AsyncCityService())
    private let cityService: CityService
    
    var notification: RemoteNotification?
    
    init(cityService: CityService) {
        self.cityService = cityService
    }
    
    func navigationAction(for notification: [AnyHashable: Any], completion: @escaping (PushNavigationAction?) -> Void) {
        defer {
            self.notification = nil
        }
        var navigationAction: PushNavigationAction?
        if let cityId = notification["cityId"] as? CityID {
            cityService.getCities { result in
                switch result {
                case let .success(cities):
                    navigationAction = .navigateToCityDetails(cities: cities, cityId: cityId)
                case .failure:
                    navigationAction = nil
                }
                completion(navigationAction)
            }
        } else {
            completion(navigationAction)
        }
    }
}
