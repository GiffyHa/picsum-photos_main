//
//  PhotosViewModelTests.swift
//  picsum-photosTests
//
//  Created by giffy on 22/01/26.
//

import XCTest
@testable import picsum_photos

@MainActor
final class PhotosViewModelTests: XCTestCase {

    private var viewModel: PhotosViewModel!
    private var mockUseCase: MockGetPhotosUseCase!

    override func setUp() {
        mockUseCase = MockGetPhotosUseCase()
        viewModel = PhotosViewModel(getPhotosUseCase: mockUseCase)
    }

    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
    }

    func test_toggleBookmark_shouldNotDuplicate() {
        let photo = PhotosModel.mock(id: "1")

        viewModel.toggleBookmark(photo: photo)
        viewModel.toggleBookmark(photo: photo)
        viewModel.toggleBookmark(photo: photo)

        XCTAssertEqual(viewModel.bookmarks.count, 1)
    }

    func test_loadInitial_failure_shouldSetErrorMessage() async {
        mockUseCase.error = APIServiceError.network

        await viewModel.loadInitial()

        XCTAssertEqual(
            viewModel.errorMessage,
            APIServiceError.network.errorDescription
        )
        XCTAssertTrue(viewModel.photos.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
    }
}
