//
//  MissionDetailView.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct MissionView: View {
    var mission:Mission
    var astronauts:[String:Astronaut]
    struct CrewMember: Codable {
        let role: String
        let astronaut:Astronaut
    }
    var crew:[CrewMember]
    
    init(mission: Mission, astronauts: [String : Astronaut]) {
        self.mission = mission
        self.astronauts = astronauts
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
            ScrollView {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }
                        .padding(.top)
                        Divider()
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Mission Highlights")
                                .font(.title.bold())
                            if let date = mission.formattedLaunchDate {
                                Spacer()
                                VStack(alignment:.trailing){
                                    Text(date)
                                        .font(.caption)
                                }
                            }
                        }

                            .padding(.bottom, 5)

                        Text(mission.description)
                    }
                    .padding(.horizontal)

                }
                .padding(.bottom)
                crewMembersView
                    .padding(.horizontal)
            }
            .navigationTitle(mission.displayName)
            .navigationBarTitleDisplayMode(.inline)

        }
    
    var crewMembersView:some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.opacity(0.8))
                            }
                        }
                        .foregroundColor(.secondary)
                        .padding(.trailing)
                        .background(.ultraThinMaterial)
                        .clipShape(
                            .rect(topLeadingRadius: 30, bottomLeadingRadius: 30, bottomTrailingRadius: 10, topTrailingRadius: 10, style: .circular)
                        )

                    }
                }
            }
        }
    }
}

#Preview {
    let missions = MissionService().all()
    let astros = AstronautService().all()
    return MissionView(mission: missions[1], astronauts: astros)
}
