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
           VistaPrincipal()
            
        }

    }
}

class ViewModel: ObservableObject {
    @Published var count = 0
    
    func plus(){
        count += 1
    }
}

struct VistaPrincipal: View{
    @StateObject var copia = ViewModel()
    var body: some View{
        VStack{
            VistaHija()
            BotonView()
               
        }
        .environmentObject(copia)
    }
}

struct VistaHija: View{
    @EnvironmentObject var copia : ViewModel
    var body: some View{
        Text("Contador actual: \(copia.count)")
    }
}

struct BotonView:View{
    @EnvironmentObject var copia : ViewModel
    var body: some View{
        VStack{
            Button(action:{
                copia.plus()
            }){
                Text("ahora es \(copia.count)")
            }
        }
    }

}




#Preview {
    ContentView()
}
