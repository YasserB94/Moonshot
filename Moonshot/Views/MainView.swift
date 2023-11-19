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
    
    @State private var currentLayoutOption:MainViewLayoutOption = .grid
    
    private enum MainViewLayoutOption:Identifiable,CaseIterable,CustomStringConvertible{
        case grid;
        case list;
        
        var id:Self{self}
        
        var description: String{
            switch self{
            case .grid:return "grid";
            case .list:return "list";
            }
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                switch(currentLayoutOption){
                case .grid:
                    ScrollView {
                        MissionsGridView(missions:missions,astronauts: astronauts)
                            .padding(.horizontal,5)
                    }
                case .list:
                    MissionsListView(missions:missions,astronauts: astronauts)
                        .listStyle(.plain)
                }
                
            }
            .toolbar(content: {
                Picker("Layout", selection: $currentLayoutOption) {
                    ForEach(MainViewLayoutOption.allCases,id:\.id){option in
                        Text(option.description.capitalized)
                    }
                }.pickerStyle(.segmented)
            })
            .navigationTitle("Moonshot")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
