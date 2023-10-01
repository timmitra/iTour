//
//  DestinationListingView.swift
//  iTour
//
//  Created by Tim Mitra on 2023-10-01.
//

import SwiftUI
import SwiftData

struct DestinationListingView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query var destinations: [Destination]
    
    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)
                        Text(destination.date.formatted(date: .long, time: .shortened))
                    }
                }
            }
            .onDelete(perform: deleteDestinations) // swipe to delete
        }
    }
    
    init(sort: SortDescriptor<Destination>) {
        // _destination is the query object (not the destination)
        _destinations = Query(sort: [sort])
    }
    
    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }

}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name))
}
