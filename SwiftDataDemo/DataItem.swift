//
//  DataItem.swift
//  SwiftDataDemo
//
//  Created by Mia on 4/10/2023.
//

import Foundation
import SwiftData

// 1. Create the schema for DataItem's that will be stored in the local store
@Model
class DataItem: Identifiable {
    
    var id: String
    var name: String
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
    
}
