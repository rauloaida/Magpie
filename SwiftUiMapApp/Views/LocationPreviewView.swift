//
//  LocationPreviewView.swift
//  SwiftUiMapApp
//
//  Created by Raul Oaida on 10/12/22.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @EnvironmentObject private var vm: LocationsViewModel
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16.0) {
                imageSection
                titleSection
            }
          
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
           
        }
        .padding(20)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .offset(y: 65)
        )
        .cornerRadius(10)
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            LocationPreviewView(location: LocationsDataService.locations.first!)
                .padding()
        }
        .environmentObject(LocationsViewModel())
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
                     
            }
        }
        .padding(6)
        .background(Color.white)
        .cornerRadius(16)
    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
           
            Text("Last Updated: 9 min ago").font(.custom("Roboto Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.17, green: 0.18, blue: 0.26, alpha: 0.5)))
              //  .padding(.vertical, 6)
            if location.batteryLevel < 25 {
                Image(systemName: "battery.25")
                    .foregroundColor(Color("AccentColor"))
            } else if location.batteryLevel < 50 {
                Image(systemName: "battery.50")
                    .foregroundColor(Color("Yellow"))
            } else if location.batteryLevel < 75 {
                   Image(systemName: "battery.75" )
                    .foregroundColor(Color("Green"))
            } else {
                Image(systemName: "battery.100")
                    .foregroundColor(Color("Green"))
            }
            
//                Image(systemName: "battery.75")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 34, height: 15, alignment: .leading)
//                    .foregroundColor(Color("Green"))
         
            
             //   .padding(.vertical, 6)
                
//            Text(location.name)
//                .font(.title2)
//                .fontWeight(.bold)
//                .opacity(0)
            
//            Text(location.cityName)
//                .font(.subheadline)
//                .opacity(0)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Find")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View {
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}


