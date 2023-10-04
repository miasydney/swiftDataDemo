//
//  ContentView.swift
//  SwiftDataDemo
//
//  Created by Mia on 4/10/2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    // 3. Create an environment variable and specify the path to the data context
    @Environment(\.modelContext) private var context
    
    // 4. Create a query
    @Query private var items: [DataItem]
    
    var body: some View {
        VStack {
            
            Text("Tap below to add data")
            
            Button("Add an item") {
                addItem()
            }
            
            // 4. Display items in a list
            List {
                ForEach (items) { item in
                    
                    HStack {
                        Text(item.name)
                        Spacer()
                        
                        // 4. Add a button to update the DataItems name
                        Button(action: {
                            updateItem(item)
                        }, label: {
                            Image(systemName: "pencil")
                        })
                       
                    }
                }
                .onDelete { indexes in
                    for index in indexes {
                        deleteItem(items[index])
                    }
                } // 4. Add an onDelete and call deleteItems
            }
            
        }
        .padding()
    }
    
    func addItem() {
        // Create the item
        let item = DataItem(name: "Test Item")
        
        // Add the item to the data context
        context.insert(item)
        
    }
    
    // 4. Delete Item
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }
    
    // 4. Update Item
    func updateItem(_ item: DataItem) {
        // Edit the item data
        item.name = "Updated Test Item"
        
        // Save the context
        try? context.save()
    }
    
}

#Preview {
    ContentView()
}
