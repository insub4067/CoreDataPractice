//
//  ContentView.swift
//  CoreDataPractice
//
//  Created by 김인섭 on 10/25/23.
//

import SwiftUI

struct ContentView: View {
    
    let viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear { viewModel.onAppear() }
    }
}

#Preview {
    ContentView()
}
