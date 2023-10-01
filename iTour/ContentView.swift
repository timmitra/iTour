//
//  ContentView.swift
//  iTour
//
//  Created by Tim Mitra on 2023-09-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @State private var path = [Destination]()
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView()
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar{
                Button("Add Detsination", systemImage: "plus", action: addDestination)
            }
        }
    }
     
    /* when we started we could a sample data */
    /* Button("Add Samples", action: addSamples) // in toolbar */
    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func addDestination() {
        let destination = Destination() // new empty destination
        modelContext.insert(destination) // insert the empty destination
        path = [destination] // show this with the navigation
    }
    
}

#Preview {
    ContentView()
}
