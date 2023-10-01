//
//  EditDestinationView.swift
//  iTour
//
//  Created by Tim Mitra on 2023-09-30.
//

import SwiftUI
import SwiftData

struct EditDestinationView: View {
    
    @Bindable var destination: Destination
    @State private var newSiteName = ""
    
    var body: some View {
        Form {
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details)
            DatePicker("Date", selection: $destination.date)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("Meh").tag(1)
                    Text("Maybe").tag(2)
                    Text("Must").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            Section("Sites") {
                ForEach(destination.sites) { site in
                    Text(site.name)
                }
                HStack {
                    TextField("Add a new site in \(destination.name)", text: $newSiteName)
                    Button("Add", action: addSite)
                }
            }
            
            .navigationTitle("Edit Destination")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    func addSite() {
        guard newSiteName.isEmpty == false else { return }
        
        withAnimation {
            let site = Site(name: newSiteName)
            destination.sites.append(site)
            newSiteName = ""
        }
    }
}

#Preview {
    do {
        // need config & container to feed the data
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example Destination", details: "Expample details go here and expand automatically as they are edited.")
        
    return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
            fatalError("Failed to create model")
        }
}
