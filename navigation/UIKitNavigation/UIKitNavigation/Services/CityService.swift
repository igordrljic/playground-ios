//
//  CityService.swift
//  UIKitNavigation
//
//  Created by Igor Drljic on 2.11.21..
//

import Foundation

typealias CityID = Int

struct City: Identifiable {
    let id: CityID
    let name: String
}

protocol CityService {
    func getCities(completion: @escaping (Result<[City], Error>) -> Void)
}

class AsyncCityService: CityService {
    func getCities(completion: @escaping (Result<[City], Error>) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
            let cities = [City(id: 0, name: "Belgrade"),
                          City(id: 1, name: "Budapest"),
                          City(id: 2, name: "Novi Sad"),
                          City(id: 3, name: "Sarajevo"),
                          City(id: 4, name: "Kopar"),
                          City(id: 5, name: "Izola")]
            DispatchQueue.main.async {
                completion(.success(cities))
            }
        }
    }
}
