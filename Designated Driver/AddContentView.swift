//
//  AddContentView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 1/3/21.
//

import SwiftUI
import MapKit

struct AddContentView: View {
    
    @State var showingDetail = false
    
    @EnvironmentObject private var viewModel: MapViewContainer
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Button(action: {showingDetail.toggle()}, label: {
                        Image(systemName: "plus").foregroundColor(.white)
                            .padding(8)
                    })
                    .background(Color.blue)
                    .cornerRadius(40)
                    .padding()
                }
            }
        }
    }
    
    func getUserLocation() -> CLLocationCoordinate2D{
        return viewModel.mapView.userLocation.coordinate
    }
}

struct AddContentView_Previews: PreviewProvider {
    static var previews: some View {
        AddContentView()
    }
}
