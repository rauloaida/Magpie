//
//  LocationsView.swift
//  SwiftUiMapApp
//
//  Created by Raul Oaida on 10/12/22.
//

import SwiftUI
import MapKit
import CoreLocation
import CoreLocationUI


struct LocationsView: View {
    
   // @StateObject private var vm = LocationsViewModel()
    @EnvironmentObject private var vm: LocationsViewModel //we can use this in all views now because we initialize the view model once as an environment model when the app launches (SwiftUiMapAppApp)
    
    @StateObject private var viewModel = ContentViewModel()
    
    let maxWidthForiPad: CGFloat = 700
    
    
    var body: some View {
            ZStack {
                mapLayer
                    .ignoresSafeArea()

        
                VStack(spacing: 0) {
                    header
                        .padding()
                        .frame(maxWidth: maxWidthForiPad)
                    Spacer()
                    locationsPreviewStack
                }
            }
            .sheet(item: $vm.sheetLocation) { location in
                LocationDetailView(location: location)
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}



extension LocationsView {
    private var header: some View {
        VStack {
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title3)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .animation(.none, value: vm.mapLocation)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                    }

                }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        
        Map(coordinateRegion: $vm.mapRegion, showsUserLocation: true,
            annotationItems: vm.locations,
            annotationContent: { location in
           // MapMarker(coordinate: location.coordinates, tint: .blue)
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }

            }
        })
    }
    
    
   
  

    
    
    private var locationsPreviewStack: some View {
        ZStack {
        ForEach(vm.locations) { location in
            if vm.mapLocation == location {
                LocationPreviewView(location: location)
                    .shadow(color: Color.black.opacity(0.3), radius: 20)
                    .padding()
                    .frame(maxWidth: maxWidthForiPad)
                   // .background(Color.orange)
                    .frame(maxWidth: .infinity)
                    //.background(Color.green)
                    .transition(.asymmetric(
                        insertion: .move(edge: .trailing),
                        removal: .move(edge: .leading)))
            }
           
        }
        }
    }
}
