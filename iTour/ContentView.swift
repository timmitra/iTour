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
    @State private var sortOrder = SortDescriptor(\Destination.name)
    
    var body: some View {
        NavigationStack(path: $path) {
            DestinationListingView()
            .navigationTitle("iTour")
            .navigationDestination(for: Destination.self, destination: EditDestinationView.init)
            .toolbar{
                Button("Add Detsination", systemImage: "plus", action: addDestination)
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    Picker("Sort", selection: $sortOrder) {
                        Text("Name")
                            .tag(SortDescriptor(\Destination.name))
                        Text("Priority")
                            .tag(SortDescriptor(\Destination.priority, order: .reverse))
                        Text("Date")
                            .tag(SortDescriptor(\Destination.date))
                    }
                    .pickerStyle(.inline) // with no title
                }
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
