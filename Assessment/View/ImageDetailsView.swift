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
            .padding()
            .navigationTitle("Image Details")
            .navigationBarTitleDisplayMode(.inline)
            .frame(width: UIScreen.main.bounds.width)
        }
    }
    
    var verticalView: some View {
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
    }
    
    var horizontalView: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: imageItem.getImageUrl()))
                .resizable()
                .scaledToFill()
                .frame(width: width, height: width)
                .clipped()
            
            VStack(alignment: .leading, spacing: 16) {
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
            
            Spacer()
        }
    }
}
