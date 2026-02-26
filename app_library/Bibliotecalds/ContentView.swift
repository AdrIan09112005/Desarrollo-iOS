//
//  ContentView.swift
//  Bibliotecalds
//
//  Created by Alan on 11/2/26.
//

import SwiftUI

struct ContentView: View {
    
    // Detectar orientación
    @State private var isLandscape = false
    
    let books = [
        // Libro 1
        (imagen: "1Libro", titulo: "Clean Architecture", autor: "Robert C. Martin", año: "2017"),
        // Libro 2
        (imagen: "libro2", titulo: "The Pragmatic Programmer", autor: "David Thomas", año: "1999"),
        // Libro 3
        (imagen: "libro3", titulo: "BIG DATA: ANÁLISIS DE GRANDES VOLÚMENES DE DATOS EN ORGANIZACIONES", autor: "Joyanes", año: "2013"),
        // Libro 4
        (imagen: "libro4", titulo: "Design Patterns", autor: "Gang of Four", año: "1994"),
        // Libro 5
        (imagen: "libro5", titulo: "Introduction to Algorithms", autor: "Cormen", año: "1990"),
        // Libro 6
        (imagen: "libro6", titulo: "You Don't Know JS", autor: "Kyle Simpson", año: "2014"),
        // Libro 7
        (imagen: "libro7", titulo: "The Swift Programming", autor: "Apple", año: "2014"),
        // Libro 8
        (imagen: "libro8", titulo: "Code Complete", autor: "Steve McConnell", año: "1993"),
        // Libro 9
        (imagen: "libro9", titulo: "Refactoring", autor: "Martin Fowler", año: "1999"),
        // Libro 10
        (imagen: "libro10", titulo: "The Mythical Man-Month", autor: "Fred Brooks", año: "1975"),
    ]
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                // Color de fondo que cambia según orientación
                if isLandscape {
                    Color.blue.edgesIgnoringSafeArea(.all)
                } else {
                    Color.red.edgesIgnoringSafeArea(.all)
                }
                
                // ScrollView para poder ver todos los libros
                ScrollView {
                    VStack(alignment: .leading, spacing: 25) {
                        
                        Text("My Library of the Software")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            // Color del texto que cambia según orientación
                            .foregroundColor(isLandscape ? .yellow : .white)
                            .padding(.top, 20)
                            .padding(.bottom, 10)
                        
                        ForEach(0..<books.count, id: \.self) { index in
                            HStack(alignment: .top){
                                Image(books[index].imagen)
                                    .resizable()
                                    .frame(width: 90, height: 120)
                                
                                VStack (alignment: .leading, spacing: 8){
                                    Text(books[index].titulo)
                                        .font(.title2)
                                        .fontWeight(.bold)
                                        // Color del título que cambia según orientación
                                        .foregroundColor(isLandscape ? .black : .white)
                                    
                                    Text("Autor: \(books[index].autor)")
                                        .font(.headline)
                                        // Color del autor que cambia según orientación
                                        .foregroundColor(isLandscape ? .white : .white.opacity(0.9))
                                    
                                    Text("Año: \(books[index].año)")
                                        .font(.subheadline)
                                        .italic()
                                        // Color del año que cambia según orientación
                                        .foregroundColor(isLandscape ? .yellow : .white.opacity(0.8))
                                }
                                Spacer()
                            }
                            .padding()
                            // Fondo de cada libro que cambia según orientación
                            .background(isLandscape ? Color.black.opacity(0.3) : Color.white.opacity(0.1))
                            .cornerRadius(10)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
            // Detectar cuando cambia la orientación
            .onAppear {
                isLandscape = geometry.size.width > geometry.size.height
            }
            .onChange(of: geometry.size) { _ in
                isLandscape = geometry.size.width > geometry.size.height
            }
        }
    }
}

#Preview {
    ContentView()
}
