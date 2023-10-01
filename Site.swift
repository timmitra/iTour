//
//  Site.swift
//  iTour
//
//  Created by Tim Mitra on 2023-10-01.
//

import Foundation
import SwiftData

@Model 
class Site {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}
