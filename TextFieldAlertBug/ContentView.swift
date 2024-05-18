//
//  ContentView.swift
//  TextFieldAlertBug
//
//  Created by Gene Bogdanovich on 18.05.24.
//

import SwiftUI

struct ContentView: View {
    @State private var shouldPresentAlert = false
    @State private var name = ""
    
    var body: some View {
        
        Button("Enter name") {
            shouldPresentAlert = true
        }
        .alert("Enter name", isPresented: $shouldPresentAlert) {
            TextField("Name", text: $name)
            Button("OK") {
                print("You entered: \(name)")
                name = ""
            }
            .disabled(name.isEmpty)
            // If we remove the disabled modifier, the "OK" button works as expected.
            
            Button(role: .cancel) {
                shouldPresentAlert = false
                name = ""
            } label: {
                Text("Cancel")
            }
            // If we remove the "Cancel" button, the "OK" button works as expected.
        }
    }
}

#Preview {
    ContentView()
}
