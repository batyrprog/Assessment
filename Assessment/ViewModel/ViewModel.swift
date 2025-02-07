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
    var imageUrls: [String] = []
    var error: Error? = nil
    
    var didFetchImages: Bool = false
    
    init() {
    }
    
    func fetchImages(_ searchText: String) async {
        guard !searchText.isEmpty else {
            print("Eeror searchText")
            return
        }
        
        guard didFetchImages == false else {
            print("Eeror didFetchImages")
            return
        }
        
        do {
            let response = try await NetworkService.shared.fetchData(searchText)
            let items = response.items ?? []
            imageUrls = items.map { $0.media?.m ?? ""}
            
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
            print("Error fetching data:")
            throw BError.invalidURL
        }
        
        let (data, urlResponse) = try await URLSession.shared.data(from: url)
        
        guard let urlRespons = urlResponse as? HTTPURLResponse, (200...299).contains(urlRespons.statusCode) else {
            print("Eeror urlRespons")
            throw BError.invalidResponse
        }
        
        do {
            let response = try JSONDecoder().decode(ResponseModel.self, from: data)
            print("response", response)
            return response
        } catch {
            print("Error fetchData", error.localizedDescription)
            throw BError.invalidData
        }
    }
}
