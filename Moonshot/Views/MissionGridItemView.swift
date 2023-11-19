//
//  MissionGridItem.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct MissionGridItem: View {
    let mission:Mission
    
    var body: some View {
        VStack(spacing:0){
            Image(mission.image)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                .shadow(radius: 10)
                .frame(maxWidth: .infinity)
                .padding(.vertical)
                .background(Color(.gray).opacity(0.30))
                .background(.ultraThinMaterial)
            VStack{
                Text(mission.displayName)
                    
                    .font(.headline)
                Text(
                    mission.formattedLaunchDate ?? "N/A"
                )
                .font(.caption)
            }
            .foregroundStyle(.white)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .overlay {
            RoundedRectangle(cornerRadius: 10)
                .stroke(.white)
        }
    }
}

#Preview {
    MissionGridItem(mission: Mission(id: 1, crew: [], description: "Foo bar", launchDate: .now))
}
