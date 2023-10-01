//
//  ContentView.swift
//  iTour
//
//  Created by Tim Mitra on 2023-09-30.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
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
            }
            .navigationTitle("iTour")
        }
    }
}

#Preview {
    ContentView()
}
