//
//  ContentView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 12/18/20.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    var body: some View {
        MapView().environmentObject(MapViewContainer())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
