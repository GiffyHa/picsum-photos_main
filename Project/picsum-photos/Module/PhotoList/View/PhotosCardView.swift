//
//  PhotosCardView.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

struct PhotosCardView: View {
    let photo: PhotosModel
    let isBookmarked: Bool
    let onBookmarkTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack {
                AsyncImage(url: URL(string: photo.downloadURL)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ZStack {
                        Color.gray.opacity(0.3)
                        ProgressView()
                    }
                }
                .id(photo.id)
            }
            .frame(height: 220)
            .clipped()
            .cornerRadius(12)

            HStack {
                Text(photo.author)
                    .font(.headline)
                    .lineLimit(1)
                Spacer()
                Button(action: onBookmarkTap) {
                    Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                        .foregroundColor(isBookmarked ? .blue : .gray)
                }
                .buttonStyle(BorderlessButtonStyle())
            }
        }
        .padding(.horizontal)
    }
}
