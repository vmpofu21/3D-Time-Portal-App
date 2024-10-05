//
//  LocationView.swift
//  Sample
//
//  Created by Nardos Mamo on 11/29/23.
//
import CoreLocation
import MapKit
import SwiftUI

import Foundation
struct LocationView: View {
    @StateObject private var viewModel = MapViewModel()
    
    let annotations = [
        Place(name: "Giza", coordinate: CLLocationCoordinate2D(latitude: 29.9765, longitude: 31.1325)),
        Place(name: "Taj Mahal", coordinate: CLLocationCoordinate2D(latitude: 27.1750, longitude: 78.0422)),
        Place(name: "Amazon", coordinate: CLLocationCoordinate2D(latitude: -3.4653, longitude: -62.2159))
    ]
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true, annotationItems: annotations) { place in
            MapAnnotation(coordinate: place.coordinate) {
                HStack {
                    Image(systemName: "mappin.circle.fill")
                        .foregroundColor(Color.red)
                    
                    Text(place.name)
                        .fixedSize()
                        .foregroundColor(Color.black)
                        .font(.system(size: 14))
                        .bold()
                }
                .padding(.all, 7)
                .background(.white)
                .cornerRadius(21)
                .shadow(radius: 5)
                
                .overlay(
                    Image(systemName: "arrowtriangle.left.fill")
                        .rotationEffect(Angle(degrees: 270))
                        .foregroundColor(Color.white)
                        .offset(y: 20)
                    , alignment: .center)
            }
        }
        .ignoresSafeArea()
        .accentColor(Color.blue)
        .onAppear {
            viewModel.checkIfLocationServicesEnabled()
        }
    }
}

// Make customised annotated pins for the view:

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
    }
}

struct Place: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

