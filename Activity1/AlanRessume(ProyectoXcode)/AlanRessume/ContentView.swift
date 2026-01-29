//
//  ContentView.swift
//  Actividad 1
//
//  Created by Alumno on 28/1/26.
//

import SwiftUI

struct ContentView: View {
    var nombre = "Alan"
    let edad = "20"
    var experiencia = ["proyecto 1", "proyecto 2", "proyecto 3"]
    
    var body: some View{
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Nombre: \(nombre) edad: \(edad)")
            ForEach (experiencia, id: \.self) { proyecto in Text("\(proyecto)")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
