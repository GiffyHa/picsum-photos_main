//
//  PhotosViewModel.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import Foundation
import Combine

@MainActor
final class PhotosViewModel: ObservableObject {

    @Published private(set) var photos: [PhotosModel] = []
    @Published private(set) var isLoading: Bool = false
    @Published var errorMessage: String?
    @Published private(set) var bookmarks: [PhotosModel] = []

    private var currentPage: Int = 1
    private let limit: Int = 10
    private var canLoadMore: Bool = true

    private let getPhotosUseCase: GetPhotosUseCase

    init(getPhotosUseCase: GetPhotosUseCase) {
        self.getPhotosUseCase = getPhotosUseCase
    }

    func loadInitial() {
        reset()
        loadMore()
    }

    func loadMore() {
        guard !isLoading, canLoadMore else { return }

        isLoading = true
        errorMessage = nil

        Task {
            do {
                let result = try await getPhotosUseCase.execute(
                    page: currentPage,
                    limit: limit
                )

                if result.isEmpty {
                    canLoadMore = false
                } else {
                    photos.append(contentsOf: result)
                    currentPage += 1
                }
            } catch {
                errorMessage = error.localizedDescription
            }

            isLoading = false
        }
    }

    func toggleBookmark(photo: PhotosModel) {
        if let index = bookmarks.firstIndex(where: { $0.id == photo.id }) {
            bookmarks.remove(at: index)
        } else {
            bookmarks.append(photo)
        }
    }

    func isBookmarked(_ photo: PhotosModel) -> Bool {
        bookmarks.contains(where: { $0.id == photo.id })
    }

    private func reset() {
        currentPage = 1
        canLoadMore = true
        photos.removeAll()
    }
}
