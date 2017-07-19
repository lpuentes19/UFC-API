//
//  UFCFighter.swift
//  UFC-API
//
//  Created by Luis Puentes on 7/18/17.
//  Copyright © 2017 LuisPuentes. All rights reserved.
//

import Foundation

struct UFCFighter {
    
    var firstName: String?
    var lastName: String?
    var wins: Int?
    var losses: Int?
    var weightClass: String?
    var imageURL: String?
    
    var fullName: String {
        guard let first = firstName,
            let last = lastName else { return "No name" }
        
        return "\(String(describing: first)) \(String(describing: last))"
    }
}
