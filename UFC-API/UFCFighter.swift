//
//  UFCFighter.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation

class UFCFighter {
    
    let firstName: String
    let lastName: String
    let wins: Int
    let losses: Int
    let weightClass: String
    let imageURL: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    
    init(firstName: String, lastName: String, wins: Int, losses: Int, weightClass: String, imageURL: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.wins = wins
        self.losses = losses
        self.weightClass = weightClass
        self.imageURL = imageURL
    }
}
