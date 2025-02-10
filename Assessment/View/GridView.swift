//
//  GridView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI

struct GridView: View {
    
    @EnvironmentObject var contentViewModel: ContentViewModel
    @StateObject var viewModel: ViewModel
    
    var gridItems: [GridItem] {
        let count = contentViewModel.isPortrait ? 2 : 4
        return Array(repeating: GridItem(.flexible(), spacing: 1), count: count)
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 1) {
                    ForEach(viewModel.imageItems, id: \.self) { item in
                        NavigationLink {
                            ImageDetailsView(imageItem: item)
                        } label: {
                            GridCell(url: item.getImageUrl())
                                .frame(width: cellSize(), height: cellSize())
                                .clipShape(Rectangle())
                                .clipped()
                        }
                        .accessibilityIdentifier("gridCell_0")
                    }
                }
                .accessibilityIdentifier("collectionView")
            }
            .accessibilityIdentifier("gridScrollView")
        }
    }
    
    private func cellSize() -> CGFloat {
        let columnsCount = contentViewModel.isPortrait ? 2 : 4
        let padding      = contentViewModel.isPortrait ? 0 : 120
        return (UIScreen.main.bounds.width - CGFloat(padding)) / CGFloat(columnsCount) - 1
    }
}
