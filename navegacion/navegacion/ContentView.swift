//
//  ContentView.swift
//  navegacion
//
//  Created by Geraldine Torres García  on 06/10/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTransport: String?
    @State private var isActive: Bool = false
   
    var body: some View {
        NavigationStack {
            VStack {
                Text("Selecciona tu Transporte")
                    .font(.title)
                    .padding()
               
                ScrollView(.horizontal) {
                    HStack {
                        Button(action: {
                            selectedTransport = "Airplane"
                            isActive = true
                        }) {
                            MeansOfTransportView(name: "Airplane", icon: "airplane")
                        }
                       
                        Button(action: {
                            selectedTransport = "Bus"
                            isActive = true
                        }) {
                            MeansOfTransportView(name: "Bus", icon: "bus")
                        }
                    }
                }
               
                // Updated NavigationLink
                NavigationLink(
                    destination: TransportOptionsView(
                        transportType: selectedTransport ?? "",
                        options: transportOptions(for: selectedTransport)
                    ),
                    isActive: $isActive
                ) {
                    EmptyView() // Empty view to replace deprecated label usage
                }
            }
            .navigationTitle("Transport Selection")
        }
    }
   
    func transportOptions(for transportType: String?) -> [String] {
        switch transportType {
        case "Airplane":
            return ["Aeromexico", "Volaris", "Anna"]
        case "Bus":
            return ["Omnibus", "Senda"]
        default:
            return []
        }
    }
}

struct TransportOptionsView: View {
    var transportType: String
    var options: [String]
   
    var body: some View {
        VStack {
            Text("Available \(transportType) options")
                .font(.largeTitle)
                .padding()
           
            List(options, id: \.self) { option in
                Text(option)
            }
        }
    }
}

struct MeansOfTransportView: View {
    var name: String
    var icon: String
   
    var body: some View {
        Label(name, systemImage: icon)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.white)
            .cornerRadius(12)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 2)
            )
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
