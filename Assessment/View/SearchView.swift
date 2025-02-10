//
//  SearchView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel = ViewModel()
    @State private var searchText: String = ""
    
    @State private var pendingRequestWorkItem: DispatchWorkItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                    if let error = viewModel.error {
                        ContentUnavailableView("Error: \(error.localizedDescription)",
                                               systemImage: "photo.on.rectangle.angled")
                    } else {
                        if viewModel.isLoading {
                            ProgressView()
                                .imageScale(.large)
                        } else {
                            GridView(viewModel: viewModel)
                        }
                    }
            }
            .searchable(text: $searchText)
            .navigationTitle("Flickr Search")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onChange(of: searchText) { _, newValue in
            waitAndSeach(newValue)
        }
        .onAppear() {
            fetchData(searchText)
        }
    }
    
    private func fetchData(_ searchText: String) {
        Task {
            await viewModel.fetchImages(searchText)
        }
    }
    
    private func waitAndSeach(_ newValue: String) {
        viewModel.didFetchImages = false
        
        pendingRequestWorkItem?.cancel()
        
        let requestWorkItem = DispatchWorkItem {
            fetchData(newValue)
        }
        
        pendingRequestWorkItem = requestWorkItem
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: requestWorkItem)
    }
}
