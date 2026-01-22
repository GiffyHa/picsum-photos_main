//
//  BookmartView.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

struct BookmarkView: View {
    @ObservedObject var viewModel: PhotosViewModel

    var body: some View {
        VStack(spacing: 0) {

            if viewModel.bookmarks.isEmpty {
                emptyState
            } else {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(Array(viewModel.bookmarks)) { photo in
                            PhotosCardView(
                                photo: photo,
                                isBookmarked: true,
                                onBookmarkTap: {
                                    viewModel.toggleBookmark(photo: photo)
                                }
                            )
                        }
                    }
                    .padding(.top, 12)
                }
            }
        }
    }

    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "bookmark")
                .font(.system(size: 40))
                .foregroundColor(.gray)

            Text("No bookmarks yet")
                .font(.headline)

            Text("Tap the bookmark icon on a photo to save it here.")
                .font(.subheadline)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
