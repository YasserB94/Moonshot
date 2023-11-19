//
//  AstronautView.swift
//  Moonshot
//
//  Created by Yasser Bal on 19/11/2023.
//

import SwiftUI

struct AstronautView: View {
    var astronaut:Astronaut
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                    .padding(.horizontal)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Divider()
                VStack(alignment: .leading) {
                    Text(astronaut.description)
                }
                .padding(.horizontal)
                
            }
            .padding(.bottom)
        }
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
    #Preview {
        let astros = AstronautService().all()
        return AstronautView(astronaut: astros.first?.value ?? Astronaut(id: "1", name: "Bob", description: "Bob"))
    }
