//
//  MissionService.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

struct MissionService {
    private var missions:[Mission];
    
    init(){
        missions = MissionService.loadMissions()
    }
    
    func all()->[Mission]{
        return self.missions
    }
    
    private static func loadMissions()->[Mission]{
        do{
            return try Bundle.main.decode(file: "missions", fileExtension: "json")
        }catch {
            fatalError("""
MissionService - loadMissions
\(error.localizedDescription)
""")
        }
    }
}
