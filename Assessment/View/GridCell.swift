//
//  GridCell.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Kingfisher

struct GridCell: View {
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
    }
}
