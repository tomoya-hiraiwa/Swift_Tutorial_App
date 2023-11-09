//
//  MapView.swift
//  MyMap
//
//  Created by Tomoya Hiraiwa on 2023/11/08.
//

import SwiftUI
import MapKit

enum MapType{
    case stadard
    case satellite
    case hybrid
}

struct MapView: UIViewRepresentable {
    let searchKey: String
    let mapType: MapType
    func makeUIView(context: Context) -> MKMapView {
        MKMapView()
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        print(searchKey)
        switch mapType {
        case .stadard:
            uiView.preferredConfiguration = MKStandardMapConfiguration(elevationStyle: .flat)
        case .satellite:
            uiView.preferredConfiguration = MKImageryMapConfiguration()
        case .hybrid:
            uiView.preferredConfiguration = MKHybridMapConfiguration()
        }
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(
        searchKey,
        completionHandler: {(placemarks, error) in
            if let placemarks,
               let firstPlacemark = placemarks.first,
               let location = firstPlacemark.location{
                let targetCoordinate = location.coordinate
                print(targetCoordinate)
                
                let pin = MKPointAnnotation()
                pin.coordinate = targetCoordinate
                pin.title = searchKey
                uiView.addAnnotation(pin)
                uiView.region = MKCoordinateRegion(
                    center: targetCoordinate,
                    latitudinalMeters: 500.0,
                    longitudinalMeters: 500.0
                )
            }
        })
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(searchKey: "羽田空港",mapType: .stadard)
        
    }
}
