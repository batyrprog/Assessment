//
//  ImageDetailsView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Kingfisher

struct ImageDetailsView: View {
    var imageItem: Item
    
    private let width = UIScreen.main.bounds.width - 32
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                KFImage(URL(string: imageItem.getImageUrl()))
                    .resizable()
                    .scaledToFill()
                    .frame(width: width, height: width)
                    .clipped()
                
                Text(imageItem.getTitle())
                    .font(.headline)
                
                VStack(alignment: .leading, spacing: 16) {
                    Text(attributedString(imageItem.getDescription()) ?? "")
                    Text(imageItem.getAuthor())
                    Text(imageItem.getFormattedPublishedDate())
                }
                .font(.subheadline)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Image Details")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
