//
//  GridView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Kingfisher

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

struct GridCell: View {
    let dimension: CGFloat = (UIScreen.main.bounds.width / 3) - 1
    var url: String
    
    var body: some View {
        Group {
            if !url.isEmpty {
                KFImage(URL(string: url))
                    .resizable()
                    .scaledToFill()
                    
            } else {
                Color.gray
            }
        }
        .frame(width: dimension, height: dimension)
        .clipped()
    }
}
