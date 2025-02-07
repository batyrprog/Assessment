//
//  ContentViewModel.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Combine

@Observable
class ContentViewModel: ObservableObject {
    var isPortrait: Bool = UIScreen.main.bounds.height > UIScreen.main.bounds.width
        
    private var cancellable: AnyCancellable?

    init() {
        cancellable = NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { [weak self] _ in
                DispatchQueue.main.async {
                    self?.isPortrait = UIScreen.main.bounds.height > UIScreen.main.bounds.width
                }
            }
    }
}
