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
    @Query var destinations: [Destination]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(destinations) { destination in
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
                .onDelete(perform: deleteDestinations) // swipe to delete
            }
            .navigationTitle("iTour")
            .toolbar{
                Button("Add Samples", action: addSamples)
            }
        }
    }
    func addSamples() {
        let rome = Destination(name: "Rome")
        let florence = Destination(name: "Florence")
        let naples = Destination(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

#Preview {
    ContentView()
}
