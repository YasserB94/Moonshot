//
//  Mission.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

struct Mission: Codable,Identifiable {
    
    struct CrewMember: Codable {
        let name:String
        let role: String
    }
    
    let id: Int
    let crew: [CrewMember]
    let description: String
    let launchDate: Date?
    
    var displayName: String {
        "Apollo \(id)"
    }

    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate:String?{
        guard let date = launchDate else {
            return nil
        }
        return date.formatted(date:.abbreviated,time:.omitted)
    }
}
