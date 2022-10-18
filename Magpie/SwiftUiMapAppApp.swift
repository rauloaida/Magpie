//
//  SwiftUiMapAppApp.swift
//  SwiftUiMapApp
//
//  Created by Raul Oaida on 10/12/22.
//

import SwiftUI

@main
struct SwiftUiMapAppApp: App {
    
    @StateObject private var vm = LocationsViewModel()
  //  var onboarding = true
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
//            if onboarding {
//                LocationsView()
//                    .environmentObject(vm)
//            } else {
//                WelcomeView()
//                    .environmentObject(vm)
//            }
          
//            LocationsView()
//                .environmentObject(vm)
        }
    }
}
