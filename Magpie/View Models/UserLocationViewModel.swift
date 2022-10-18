//
//  ContentViewModel.swift
//  Magpie
//
//  Created by Raul Oaida on 10/16/22.
//

import Foundation
import MapKit


enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 37.331516, longitude: -121.891)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}


final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServiecsIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
          //  checkLocationAuthorization()
         //   locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("show alert saying location is turned off in phone settings")
        }
    }
    
  private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }

        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted")
        case .denied:
            print("you have denied this app location persmission, go to settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    
    }
}



