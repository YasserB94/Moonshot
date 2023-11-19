//
//  MainView.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct MainView: View {
    private var astronauts:[String:Astronaut] = AstronautService().all()
    private var missions:[Mission] = MissionService().all()
    

    
    var body: some View {
        NavigationStack{
            ZStack{
            ScrollView{
                MissionsGridView(missions:missions,astronauts: astronauts)
                        .padding(.horizontal,5)
                }
            }.navigationTitle("Moonshot")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
