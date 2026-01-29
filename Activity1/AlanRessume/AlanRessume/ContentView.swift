//
//  ContentView.swift
//  AlanResumee
//
//  Created by Alan Adrian Estrada Alfaro on 28/1/26.
//

import SwiftUI

struct ContentView: View {
    var Nombre = "Alan"
    let Edad = "20"
    var Experiencia = ["Proyecto 1", "Proyecto 2", "Proyecto 3"]
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("nombre: \(Nombre) edad: \(Edad)")

            ForEach (Experiencia, id: \.self) { proyecto in
                Text("\(proyecto)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}