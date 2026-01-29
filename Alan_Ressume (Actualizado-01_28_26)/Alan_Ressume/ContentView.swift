//
//  ContentView.swift
//  Actividad 1
//
//  Created by Alumno on 28/1/26.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Datos personales
    let nombre: String = "Alan Estrada"
    let edad: Int = 20
    
    let experiencia: [String] = [
        "Sistema Base datos Vuelos",
        "Calculadora IMC",
        "App Interactiva Android"
    ]
    
    let formacionAcademica = (
        carrera: "Ingeniería en Desarrollo de Software",
        institucion: "Universidad TecMilenio",
        añoGraduacion: 2023,
        completo: true
    )
    
    // MARK: - Estados
    @State private var mostrarCursos: Bool = false
    @State private var perfilActivo: Bool = true
    @State private var nivelHabilidad: Double = 78
    
    // MARK: - Vista
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                // ENCABEZADO CON FOTO
                VStack(spacing: 12) {
                    Circle()
                        .fill(
                            LinearGradient(
                                colors: [.blue, .purple],
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 150, height: 150)
                        .overlay(
                            Image(systemName: "laptopcomputer")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.white)
                        )
                    
                    VStack(spacing: 6) {
                        Text(nombre)
                            .font(.system(size: 28, weight: .bold))
                            .foregroundColor(.primary)
                        
                        HStack(spacing: 12) {
                            Label("\(edad) años", systemImage: "calendar")
                            Label("México", systemImage: "location.fill")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 20)
                
                // SECCIÓN DE EXPERIENCIA
                CardView(title: "Proyectos Personales", icon: "briefcase.fill") {
                    VStack(alignment: .leading, spacing: 12) {
                        ForEach(Array(experiencia.enumerated()), id: \.offset) { index, item in
                            HStack(alignment: .top, spacing: 10) {
                                Text("\(index + 1).")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.blue)
                                Text(item)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                        }
                    }
                }
                
                // SECCIÓN DE FORMACIÓN
                CardView(title: "Educación", icon: "graduationcap.fill") {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: formacionAcademica.completo ? "checkmark.circle.fill" : "clock.fill")
                                .foregroundColor(formacionAcademica.completo ? .green : .orange)
                            Text(formacionAcademica.carrera)
                                .fontWeight(.medium)
                        }
                        
                        Text(formacionAcademica.institucion)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        
                        Text("Graduación: \(formacionAcademica.añoGraduacion)")
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background(Color.blue.opacity(0.1))
                            .cornerRadius(8)
                    }
                }
                
                // CONTROLES INTERACTIVOS
                VStack(spacing: 20) {
                    // BOTÓN DE CURSOS
                    Button(action: { mostrarCursos.toggle() }) {
                        HStack {
                            Image(systemName: "book.fill")
                            Text("Ver Cursos Especializados")
                            Spacer()
                            Image(systemName: "chevron.right")
                        }
                        .padding()
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(12)
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    // SELECTOR DE PERFIL
                    HStack {
                        Image(systemName: perfilActivo ? "hammer.fill" : "person.2.fill")
                            .foregroundColor(perfilActivo ? .blue : .purple)
                        
                        Picker("", selection: $perfilActivo) {
                            Text("Desarrollador").tag(true)
                            Text("Líder Técnico").tag(false)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // INDICADOR DE NIVEL
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Nivel de Especialización")
                                .font(.headline)
                            Spacer()
                            Text("\(Int(nivelHabilidad))%")
                                .fontWeight(.bold)
                                .foregroundColor(nivelHabilidad > 70 ? .green : .orange)
                        }
                        
                        Slider(value: $nivelHabilidad, in: 0...100, step: 1)
                            .accentColor(nivelHabilidad > 70 ? .green : .blue)
                        
                        HStack {
                            Text("Principiante")
                            Spacer()
                            Text("Experto")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.05))
                    .cornerRadius(12)
                }
            }
            .padding(.horizontal)
        }
        .background(Color(.systemGray6).ignoresSafeArea())
        .alert("Cursos Especializados 2025", isPresented: $mostrarCursos) {
            Button("Cerrar", role: .cancel) {}
        } message: {
            VStack {
                Text("""
                • Big Data & Analytics
                • Computer Vision Avanzado
                • Data Science con Python
                • SwiftUI Pro iOS 18
                """)
                .multilineTextAlignment(.leading)
            }
        }
    }
}

// COMPONENTE REUTILIZABLE PARA TARJETAS
struct CardView<Content: View>: View {
    let title: String
    let icon: String
    let content: Content
    
    init(title: String, icon: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.icon = icon
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.headline)
            }
            
            content
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.1), radius: 8, x: 0, y: 4)
        )
    }
}

#Preview {
    ContentView()
}
