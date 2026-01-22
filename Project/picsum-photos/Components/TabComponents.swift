//
//  TabComponents.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

struct TabComponents: View {

    @StateObject var viewModel: PhotosViewModel

    var body: some View {
        TabView {

            // Home Tab
            PhotosMainView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            // Bookmark Tab
            BookmarkView(viewModel: viewModel)
                .tabItem {
                    Label("Bookmark", systemImage: "bookmark")
                }
                .badge(viewModel.bookmarks.count)
        }
    }
}
