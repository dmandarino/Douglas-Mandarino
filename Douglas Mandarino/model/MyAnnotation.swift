//
//  MyAnnotation.swift
//  MapKit
//
//  Created by Douglas Mandarino on 4/16/15.
//  Copyright (c) 2015 Douglas Mandarino. All rights reserved.
//

import Foundation
import MapKit

class MyAnnotation: NSObject, MKAnnotation {
    let title: String
    let subtitle: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
        super.init()
    }
}