//
//  MainAppView.swift
//  SwiftUiMapApp
//
//  Created by Raul Oaida on 10/14/22.
//

import SwiftUI

struct MainAppView: View {
    var onboarding = false
    
    var body: some View {
        if onboarding {
            LocationsView()
        } else {
            WelcomeView()
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
