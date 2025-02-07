//
//  ImageDetailsView.swift
//  Assessment
//
//  Created by Batyr Ovezdurdyyev on 2/7/25.
//

import SwiftUI
import Kingfisher

struct ImageDetailsView: View {
    @EnvironmentObject var contentViewModel: ContentViewModel
    
    var imageItem: Item
    
    var width: CGFloat {
        contentViewModel.isPortrait ? UIScreen.main.bounds.width - 32 : UIScreen.main.bounds.width / 7 * 2
    }
    
    var body: some View {
        VStack {
            ScrollView {
                if contentViewModel.isPortrait {
                    verticalView
                } else {
                    horizontalView
                }
            }
            .navigationTitle("Image Details")
            .navigationBarTitleDisplayMode(.inline)
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
    var verticalView: some View {
        VStack(alignment: .leading, spacing: 16) {
            imageView
            
            detailsView
            
            Spacer()
        }
        .padding()
    }
    
    var horizontalView: some View {
        HStack(alignment: .top) {
            imageView
            
            detailsView
            
            Spacer()
        }
        .padding()
    }
    
    var imageView: some View {
        KFImage(URL(string: imageItem.getImageUrl()))
            .resizable()
            .scaledToFill()
            .frame(width: width, height: width)
            .clipped()
    }
    
    var detailsView: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(imageItem.getTitle())
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(attributedString(imageItem.getDescription()) ?? "")
                Text(imageItem.getAuthor())
                Text(imageItem.getFormattedPublishedDate())
            }
            .font(.subheadline)
            
            if let url = URL(string: imageItem.getImageUrl()) {
                ShareLink(item: url,
                          subject: Text(imageItem.getTitle()),
                          message: Text(imageItem.getDescription())) {
                    
                    Label("Share", systemImage: "square.and.arrow.up")
                }
            }
            
            Spacer()
        }
    }
}
