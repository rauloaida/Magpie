//
//  Location.swift
//  Magpie
//
//  Created by Raul Oaida on 10/12/22.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable {
    
    
    
  //  let id = UUID().uuidString //to conform to identifiable, you need to specify and ID -- this UUID() function generates a random id it can create different IDs for the same object if its duplicated since its totally random, and then the program interprets the data model as a new entity, but its the same one.
    
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let batteryLevel: Int
    let imageNames: [String]   //this is in [] because its an array
    let link: String
    
    // Identifiable 
    var id: String {
        // name = "Colloseum"
        // cityName = "Rome"
        // id = "ColloseumRome"
        name + cityName
    }
    
    // Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

