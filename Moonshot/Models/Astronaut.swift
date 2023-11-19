//
//  Astronaut.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

struct Astronaut:Identifiable,Codable{
    
    let id:String
    let name:String
    let description:String
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case description
    }
}
