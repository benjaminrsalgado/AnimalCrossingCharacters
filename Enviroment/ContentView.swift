// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            AnimalCrossingBackground()
            ScrollView {
                nombresAnimales()
            }
        }
        .ignoresSafeArea()
    }
}

struct Animal: Identifiable {
    let id = UUID()
    let image: String
    let nombre: String
    var esFavorito: Bool
    let color: Color
}


struct nombresAnimales: View {
    @State var personajes: [Animal] = [
        Animal(image: "goldie", nombre: "Goldie", esFavorito: true, color: Color(red: 1.0, green: 0.95, blue: 0.7)),
        Animal(image: "isabelle", nombre: "Isabelle", esFavorito: true, color: Color(red: 1.0, green: 0.85, blue: 0.9)),
        Animal(image: "tom", nombre: "Tom Nook", esFavorito: true, color: Color(red: 1.0, green: 0.9, blue: 0.8)),
        Animal(image: "kk", nombre: "K.K. Slider", esFavorito: false, color: Color(red: 0.85, green: 0.92, blue: 1.0)),
        Animal(image: "celeste", nombre: "Celeste", esFavorito: false, color: Color(red: 0.95, green: 0.8, blue: 0.9)),
        Animal(image: "mabel", nombre: "Mabel", esFavorito: false, color: Color(red: 0.8, green: 0.9, blue: 1.0)),
        Animal(image: "rover", nombre: "Rover", esFavorito: false, color: Color(red: 0.85, green: 0.95, blue: 1.0)),
        Animal(image: "sable", nombre: "Sable", esFavorito: false, color: Color(red: 0.9, green: 0.8, blue: 1.0)),
        Animal(image: "resetti", nombre: "Resetti", esFavorito: false, color: Color(red: 1.0, green: 0.85, blue: 0.7)),
        Animal(image: "blathers 1", nombre: "Blathers", esFavorito: false, color: Color(red: 0.95, green: 0.88, blue: 0.7)),
        Animal(image: "timmy", nombre: "Timmy & Tommy", esFavorito: false, color: Color(red: 1.0, green: 0.95, blue: 0.8))
    ]

    let columnas = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columnas, spacing: 24) {
            ForEach(personajes.indices, id: \.self) { index in
                AnimalCard(animal: $personajes[index])
            }
        }
        .padding(.horizontal, 20)
        .padding(.top, 30)
    }
}

struct AnimalCard: View {
    @Binding var animal: Animal
    @State private var animateStar = false

    var body: some View {
        VStack(spacing: 10) {
            Image(animal.image)
                .resizable()
                .scaledToFit()
                .frame(height: 140)
                .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
                .overlay(
                    RoundedRectangle(cornerRadius: 18, style: .continuous)
                        .stroke(Color.white, lineWidth: 6)
                )
                .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 6)

            Text(animal.nombre)
                .font(.system(size: 22, weight: .bold, design: .rounded))
                .foregroundColor(.black)
                .shadow(color: .white.opacity(0.7), radius: 2, x: 0, y: 1)

   
        }
        .padding(.vertical, 18)
        .frame(maxWidth: .infinity)
        .background(animal.color.opacity(0.85))
        .cornerRadius(24)
        .overlay(
            RoundedRectangle(cornerRadius: 24)
                .stroke(Color.white, lineWidth: 4)
        )
        .shadow(color: animal.color.opacity(0.3), radius: 10, x: 0, y: 8)
    }
}


struct AnimalCrossingBackground: View {
    var body: some View {
        ZStack {
            Color(red: 0.85, green: 0.95, blue: 0.85)
            ForEach(0..<15) { i in
                Circle()
                    .fill(Color.white.opacity(0.13))
                    .frame(width: CGFloat(Int.random(in: 80...180)), height: CGFloat(Int.random(in: 80...180)))
                    .offset(
                        x: CGFloat(Int.random(in: -180...180)),
                        y: CGFloat(Int.random(in: -400...400))
                    )
            }
        }
    }
}

#Preview {
    ContentView()
}

