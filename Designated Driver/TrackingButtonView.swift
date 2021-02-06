//
//  TrackingButtonView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 12/18/20.
//

import SwiftUI
import MapKit

struct TrackingButtonView: UIViewRepresentable {
    
    @EnvironmentObject var viewModel: MapViewContainer
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    func makeUIView(context: Context) -> MKUserTrackingButton {
        MKUserTrackingButton(mapView: viewModel.mapView)
    }
}
