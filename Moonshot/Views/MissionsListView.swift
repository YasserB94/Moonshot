//
//  MisisonListView.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct MissionsListView: View {
    var missions:[Mission]
    var astronauts:[String:Astronaut]
    
    var body: some View {
        List {
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
    return MissionsListView(missions: missions, astronauts: astros)
}
