//
//  Investfile.swift
//  TurkInvests
//
//  Created by Emre on 4.11.2018.
//  Copyright © 2018 metin emre. All rights reserved.
//

import UIKit

class invests: Codable {
   let Invests: [invets]
    
    init(Invests: [invest]) {
        self.Invests = Invests
        
    }
    
}

class invest: Codable {
    
    let name : String
    let dob : String
    let country: String
    let height: String
    let image: String
    
    
    
    init(name: String, dob : String, country: String, height: String, image: String) {
        self.name = name
        self.dob = dob
        self.country = country
        self.height = height
        self.image = image
        
        
    }
    

}
