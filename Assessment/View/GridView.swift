//
//  GridView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

struct GridView: View {
    @StateObject var viewModel: ViewModel
    
    var gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 1) {
            ForEach(viewModel.imageItems, id: \.self) { item in
                NavigationLink {
                    ImageDetailsView(imageItem: item)
                } label: {
                    GridCell(url: item.getImageUrl())
                }
            }
        }
    }
}
