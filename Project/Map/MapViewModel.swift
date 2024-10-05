//
//  MapViewModel.swift
//  Objects
//
//  Created by Nardos Mamo on 11/29/23.
//
import SwiftUI
import MapKit
import CoreLocation

enum MapDetails{
    static let startingLocation = CLLocationCoordinate2D(latitude: 42.42126, longitude: -76.49506)
    static let defaultSpan =  MKCoordinateSpan(latitudeDelta: 55.5, longitudeDelta: 55.5)
}


final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesEnabled() {
        if CLLocationManager.locationServicesEnabled(){
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            //locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Show an alert letting them know that it is turned off and to turn it on.")
        }
    }
    
    
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else{
            return
        }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("alert: restricted")
        case .denied:
            print("alert: denied")
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

