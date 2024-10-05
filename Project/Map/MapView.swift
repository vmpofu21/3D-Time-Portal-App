//  MapView.swift
//  Sample
//
//  Created by Nardos Mamo on 11/30/23.

//

import SwiftUI
import MapKit

struct MapView: View {
    init() {
           // Customize the navigation bar appearance
           UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
           UINavigationBar.appearance().shadowImage = UIImage()
       }

    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(Gizaregion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
        } else {
        }
    }

    private var Gizaregion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 29.9765, longitude: 31.1325),
            span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
}


struct TajMapView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(TajMahalRegion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
        } else {
            // Fallback on earlier versions
        }
}

    private var TajMahalRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 27.1751, longitude: 78.0421),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    }
}

struct ParisMapView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(ParisRegion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)

        } else {

            // Fallback on earlier version
    }
}
    
    private var ParisRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    }
}



struct ColosseumMapView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(ColosseumRegion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
        } else {

            // Fallback on earlier versions
    }
}

private var ColosseumRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.8902, longitude: 12.4922),
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    }
}



struct AmazonMapView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(AmazonRegion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
        } else {
            // Fallback on earlier versions
        }
    }

private var AmazonRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -3.4653, longitude: -62.2159),
            span: MKCoordinateSpan(latitudeDelta: 20, longitudeDelta: 20)
        )
    }
}



struct AntarticaMapView: View {
    var body: some View {
        if #available(iOS 17.0, *) {
            Map(initialPosition: .region(AntarcticaRegion))
                .ignoresSafeArea()
                .navigationBarTitle("", displayMode: .inline)
        } else {
            // Fallback on earlier versions
        }
}

private var AntarcticaRegion: MKCoordinateRegion {
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: -82.8628, longitude: 135),
            span: MKCoordinateSpan(latitudeDelta: 30, longitudeDelta: 30)
        )
    }
}



struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()

    }
}

