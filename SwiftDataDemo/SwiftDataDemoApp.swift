//
//  SwiftDataDemoApp.swift
//  SwiftDataDemo
//
//  Created by Mia on 4/10/2023.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: DataItem.self) // 2. Create a container storing DataItems
    }
}
