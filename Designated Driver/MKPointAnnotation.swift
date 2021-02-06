//
//  MKPointAnnotation.swift
//  Designated Driver
//
//  Created by Zachary Goldstein on 1/15/21.
//

import SwiftUI
import MapKit

class Post: NSObject, MKAnnotation {
    let title: String?
    let content: String?
    let coordinate: CLLocationCoordinate2D
    
    init(title: String?, content: String?, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.content = content
        self.coordinate = coordinate
        super.init()
    }
}

