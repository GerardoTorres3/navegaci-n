//
//  ContentView.swift
//  navegacion
//
//  Created by Geraldine Torres García  on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Selecciona tu medio de transporte")
                    .font(.title)
                    .padding()
               
                // Botón para seleccionar avión
                NavigationLink(destination: TransportOptionsView(transportType: "Avión", companies: ["Aeromexico", "Anna", "Volaris"])) {
                    Text("Avión")
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
               
                // Botón para seleccionar autobuses
                NavigationLink(destination: TransportOptionsView(transportType: "Autobús", companies: ["Omnibus", "Senda"])) {
                    Text("Autobús")
                        .font(.headline)
                        .frame(width: 200, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
        }
    }
}

struct TransportOptionsView: View {
    var transportType: String
    var companies: [String]
   
    var body: some View {
        VStack {
            Text("Opciones para \(transportType)")
                .font(.title)
                .padding()
           
            List(companies, id: \.self) { company in
                Text(company)
                    .font(.headline)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
