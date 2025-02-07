//
//  GridCell.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Kingfisher

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
        .clipShape(Rectangle())
        .clipped()
    }
}
