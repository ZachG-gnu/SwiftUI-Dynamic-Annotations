//
//  MapView.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 12/18/20.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State private var userTrackingMode: MKUserTrackingMode = .follow
    @State private var centerCoord = CLLocationCoordinate2D()
    @State private var posts = [Post]()
    
    //@EnvironmentObject private var viewModel: MapViewContainer
    
    
    var body: some View {
        ZStack{
            MKMapViewRepresentable(userTrackingMode: $userTrackingMode, centerCoord: $centerCoord, posts: posts).ignoresSafeArea(edges: .all)
            VStack{
                HStack{
                    Spacer()
                    TrackingButtonView()
                        .background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .frame(width: 20.0, height: 20.0)
                        .padding(15)
                }.padding(.vertical, 20)
                .padding(.horizontal, 10)
                Spacer()
                //AddContentView()
                Button(action: {
                    let newPost = Post(title: "Point \(posts.count)", content: "Lardas", coordinate: centerCoord)
                    self.posts.append(newPost)
                }, label: {Image(systemName: "plus").foregroundColor(.white).padding(15)})
                .background(Color.blue)
                .cornerRadius(40)
                .padding()
            }
        }
    }
}

struct MapUIView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewContainer())
    }
}
