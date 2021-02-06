//
//  MapViewContainer.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 12/18/20.
//

import SwiftUI
import MapKit

class MapViewContainer: ObservableObject{
    @Published public private(set) var mapView = MKMapView(frame: UIScreen.main.bounds)
}
