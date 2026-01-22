//
//  PhotosMainView.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

struct PhotosMainView: View {
    @StateObject var viewModel: PhotosViewModel
    @State private var showBookmarks: Bool = false

    var body: some View {
        VStack(spacing: 0) {

            // HEADER
            HeaderComponents()

            // CONTENT
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.photos) { photo in
                        PhotosCardView(
                            photo: photo,
                            isBookmarked: viewModel.isBookmarked(photo),
                            onBookmarkTap: {
                                viewModel.toggleBookmark(photo: photo)
                            }
                        )
                        .onAppear {
                            if photo == viewModel.photos.last {
                                viewModel.loadMore()
                            }
                        }
                    }

                    if viewModel.isLoading {
                        ProgressView()
                            .padding()
                    }
                }
                .padding(.top, 12)
            }
        }
        .onAppear {
            viewModel.loadInitial()
        }
    }
}
