//
//  MapSnapshotView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 1/9/21.
//

import SwiftUI
import MapKit

struct MapSnapshotView: View {
    
    let location: CLLocationCoordinate2D
    let span: CLLocationDegrees = 0.01
    
    @State private var snapshotImage: UIImage? = nil
    
    var body: some View {
        GeometryReader{ geometry in
            Group{
                if let mapImage = snapshotImage{
                    Image(uiImage: mapImage)
                }
                else{
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .background(Color(UIColor.secondarySystemBackground))
                }
            }
            .onAppear{
                generateMapSnapshot(width: geometry.size.width, height: geometry.size.height)
            }
        }.frame(width: UIScreen.main.bounds.width, height: 300)
    }
    
    func generateMapSnapshot(width: CGFloat, height: CGFloat){
        
        //Map region
        let region = MKCoordinateRegion(center: location, span: MKCoordinateSpan(latitudeDelta: span, longitudeDelta: span))
        
        //Map options
        let mapOptions = MKMapSnapshotter.Options()
        mapOptions.region = region
        mapOptions.size = CGSize(width: width, height: height)
        mapOptions.showsBuildings = true
        
        //Creating map snapshot
        let snapshotter = MKMapSnapshotter(options: mapOptions)
        snapshotter.start{ (snapShotOrNil, errorOrNil) in
            if let error = errorOrNil{
                print(error)
                return;
            }
            if let snapshot = snapShotOrNil{
                snapshotImage = snapshot.image
            }
        }
    }
}

//struct MapSnapshotView_Previews: PreviewProvider {
//    static var previews: some View {
//        MapSnapshotView()
//    }
//}
