//
//  AssessmentApp.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

@main
struct AssessmentApp: App {
    @StateObject var contentViewModel = ContentViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(contentViewModel)
        }
    }
}
