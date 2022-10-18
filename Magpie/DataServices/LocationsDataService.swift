//
//  LocationsDataService.swift
//  Magpie
//  Data set
//
//

import Foundation
import MapKit

class LocationsDataService {
    
    static let locations: [Location] = [
   
        Location(
            name: "Raul's Keys",
            cityName: "FiDi",
            coordinates: CLLocationCoordinate2D(latitude: 40.7095, longitude: -74.0080),
            description: "Where his keys are lol",
            batteryLevel: 75,
            imageNames: [
                "keys"
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        
    
        Location(
            name: "Eric's Backpack",
            cityName: "Tribeca",
            coordinates: CLLocationCoordinate2D(latitude: 40.7279, longitude: -74.0051),
            description: "Where his keys are lol",
            batteryLevel: 58,
            imageNames: [
                "backpack"
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Justin's Scooter",
            cityName: "Yonkers",
            coordinates: CLLocationCoordinate2D(latitude: 40.9326, longitude: -73.8901),
            description: "Where his keys are lol",
            batteryLevel: 25,
            imageNames: [
                "scooter"
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum"),
        Location(
            name: "Raul's BoomBox",
            cityName: "FiDi",
            coordinates: CLLocationCoordinate2D(latitude: 40.7095, longitude: -74.0090),
            description: "Where his keys are lol",
            batteryLevel: 35,
            imageNames: [
                "boombox"
            ],
            link: "https://en.wikipedia.org/wiki/Colosseum")
    ]
    
}
