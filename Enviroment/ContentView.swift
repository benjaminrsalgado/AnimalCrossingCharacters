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
            VistaPadre()
            
        }

    }
}



class ContadorGlobal: ObservableObject {
    @Published var valor = 0
}

struct VistaPadre: View{
    @StateObject var share = ContadorGlobal()
    var body: some View{
        VStack{
            VistaHija()
                .environmentObject(share)
        }
    }
}

struct VistaHija: View{
    @EnvironmentObject var share1: ContadorGlobal
    var body: some View{
        VStack{
            Text("esto es \(share1.valor)")
                .foregroundColor(.red)
            Button("Sumar 1") {
                           share1.valor += 1
                       }
        }
    }
}

#Preview {
    ContentView()
}
