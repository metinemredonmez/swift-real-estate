//
//  StarbucksAnnotation.swift
//  TurkInvests
//
//  Created by Emre on 13.01.2019.
//  Copyright © 2019 metin emre. All rights reserved.
//

import MapKit

class StarbucksAnnotation: NSObject, MKAnnotation {
    
    var coordinate: CLLocationCoordinate2D
    var phone: String!
    var name: String!
    var address: String!
    var image: UIImage!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}

