//
//  Sport.swift
//  SportsListApp
//
//  Created by Muhammad Salah on 10/4/21.
//

import Foundation

struct Sport: Decodable{
    
    enum CodingKeys: String, CodingKey {
        case name = "strSport"
        case description = "strSportDescription"
    }
    
    var sportID = UUID()
    let name: String
    let description: String?
}
