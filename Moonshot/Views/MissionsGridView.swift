//
//  MissionsGridView.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct MissionsGridView: View {
    var missions:[Mission]
    var astronauts:[String:Astronaut]
    
    let cols = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        LazyVGrid(columns: cols,spacing:0) {
            ForEach(missions) { mission in
                NavigationLink {
                    MissionView(mission: mission,astronauts: astronauts)
                } label: {
                    MissionGridItem(mission:mission)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding(10)
                }
            }
        }
    }
}

#Preview {
    let missions = MissionService().all()
    let astros = AstronautService().all()
    return MissionsGridView(missions: missions, astronauts: astros)
}
