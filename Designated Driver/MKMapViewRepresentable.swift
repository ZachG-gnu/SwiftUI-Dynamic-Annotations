//
//  MapViewRepresentable.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 12/18/20.
//

import SwiftUI
import CoreLocation
import MapKit

struct MKMapViewRepresentable: UIViewRepresentable {
    
    @Binding var userTrackingMode: MKUserTrackingMode
    @Binding var centerCoord: CLLocationCoordinate2D
    var posts: [Post]
    
    @EnvironmentObject private var mapViewContainer: MapViewContainer
    
    func makeUIView(context: Context) -> MKMapView {
        mapViewContainer.mapView.delegate = context.coordinator
        mapViewContainer.mapView.showsUserLocation = true
        mapViewContainer.mapView.setUserTrackingMode(userTrackingMode, animated: false)
        return mapViewContainer.mapView
        
    }
    
    func updateUIView(_ mapView: MKMapView, context: Context) {
        print("Updating UI View with \(mapView.annotations.count) annotations")
        
        if mapView.isUserLocationVisible{ //spaghetti code
            if self.posts.count != mapView.annotations.count-1{
                //users location counts as annotation
                mapView.removeAnnotations(mapView.annotations)
                mapView.addAnnotations(self.posts)
            }
        }
        else{
            if self.posts.count != mapView.annotations.count{
                mapView.removeAnnotations(mapView.annotations)
                mapView.addAnnotations(self.posts)
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        var parent: MKMapViewRepresentable
        
        let locationManager = CLLocationManager()
        
        init(_ parent: MKMapViewRepresentable) {
            self.parent = parent
            super.init()
            setUpLocation()
        }
        
        func setUpLocation(){
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.requestAlwaysAuthorization()
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.centerCoord = mapView.centerCoordinate
        }
        
        func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool ){
            #if DEBUG
            switch mode{
            case .follow: print(".follow")
            case .none: print(".none")
            case .followWithHeading: print(".followWithHeading")
            default: print("@unknown")
            }
            #endif
        }
        
    }
}
