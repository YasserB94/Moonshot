//
//  AstronautService.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import Foundation

struct AstronautService {
    private var astronauts:[String:Astronaut];
    
    init(){
        astronauts = AstronautService.loadAstronauts()
    }
    
    func all()->[String:Astronaut]{
        return self.astronauts
    }
    
    private static func loadAstronauts()->[String:Astronaut]{
        do{
            return try Bundle.main.decode(file: "astronauts", fileExtension: "json")
        }catch {
            fatalError("""
AstronautService - loadAstronauts
\(error.localizedDescription)
""")
        }
    }
    
    
    
}
