//
//  ContentView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello")
            }
            .searchable(text: $searchText)
            .navigationTitle("Flickr Search")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        ContentView()
    }
}
