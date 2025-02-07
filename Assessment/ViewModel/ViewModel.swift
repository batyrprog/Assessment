//
//  ViewModel.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Foundation
import Combine

@Observable
class ViewModel: ObservableObject {
    var searchText: String = ""
    var imageItems: [Item] = []
    var error: Error? = nil
    
    var didFetchImages: Bool = false
    var isLoading: Bool = false
    
    init() {
    }
    
    func fetchImages(_ searchText: String) async {
        guard !searchText.isEmpty else {
            return
        }
        
        guard didFetchImages == false else {
            return
        }
        
        isLoading = true
        defer { isLoading = false }
        do {
            let response = try await NetworkService.shared.fetchData(searchText)
            imageItems = response.items ?? []
            
            didFetchImages = true
            
        } catch(let newError) {
            error = newError
        }
    }
}

enum BError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

class NetworkService {
    private init() { }
    static let shared = NetworkService()
    
    
    
    func fetchData(_ searchText: String) async throws -> ResponseModel {
        let urlString = "https://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1&tags=\(searchText)"
        
        guard let url = URL(string: urlString) else {
            throw BError.invalidURL
        }
        
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        
        guard let urlRespons = urlResponse as? HTTPURLResponse, (200...299).contains(urlRespons.statusCode) else {
            throw BError.invalidResponse
        }
        
        do {
            let response = try JSONDecoder().decode(ResponseModel.self, from: data)
            return response
        } catch {
            throw BError.invalidData
        }
    }
}
