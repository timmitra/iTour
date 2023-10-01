//
//  Destination.swift
//  iTour
//
//  Created by Tim Mitra on 2023-09-30.
//

import Foundation
import SwiftData

@Model
class Destination {
    
    var name: String
    var details: String
    var date: Date
    var priority: Int
    @Relationship(deleteRule: .cascade) var sites = [Site]() // empty Site array
    
    init(name: String = "", details: String = "", date: Date = .now, priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
