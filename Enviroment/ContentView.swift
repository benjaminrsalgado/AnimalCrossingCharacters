//
//  ContentView.swift
//  Enviroment
//
//  Created by Benjamin Rojo on 28/07/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ListaDePersonajes()
            
        }

    }
}

struct Personaje: Identifiable {
    let id = UUID()
    let nombre: String
    let imagen: String
    var esFavorito: Bool
}

struct ListaDePersonajes: View{
    @State private var personajes: [Personaje] = [
        Personaje(nombre: "Taylor Swift", imagen: "taylor", esFavorito: false),
        Personaje(nombre: "Travis Kelcey", imagen: "travis", esFavorito: false),
        Personaje(nombre: "Sabrina carpenter", imagen: "sabrina", esFavorito: false)
    ]
    var body: some View{
        ScrollView {
            VStack {
                ForEach(personajes.indices, id: \.self) { index in
                    VStack {
                        Image(personajes[index].imagen) // imagen local en Assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)

                        Text(personajes[index].nombre)
                            .font(.headline)

                        Button(action: {
                            personajes[index].esFavorito.toggle() // cambia el favorito
                        }) {
                            Image(systemName: personajes[index].esFavorito ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.title)
                        }
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(12)
                    .padding(.bottom, 10)
                }
            }
        }
        }
    }



#Preview {
    ContentView()
}
