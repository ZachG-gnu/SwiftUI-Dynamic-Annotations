//
//  AnnotationFormView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 1/9/21.
//

import SwiftUI
import MapKit

struct AnnotationFormView: View {
    
    let coordinates: CLLocationCoordinate2D
    
    var body: some View {
        NavigationView{
            VStack{
                MapSnapshotView(location: coordinates)
                Spacer()
            }.navigationBarTitle("Create post", displayMode: .inline)
        }
    }
}

struct AnnotationFormView_Previews: PreviewProvider {
    static var previews: some View {
        AnnotationFormView(coordinates: CLLocationCoordinate2D(latitude: 80, longitude: 4))
    }
}
