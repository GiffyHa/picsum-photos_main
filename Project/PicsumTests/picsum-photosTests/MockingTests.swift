//
//  MockingTests.swift
//  picsum-photosTests
//
//  Created by giffy on 22/01/26.
//

import Foundation
@testable import picsum_photos

// MARK: - Mock GetPhotosUseCase
final class MockGetPhotosUseCase: GetPhotosUseCase {

    var result: [PhotosModel] = []
    var error: Error?

    func execute(page: Int, limit: Int) async throws -> [PhotosModel] {
        if let error = error {
            throw error
        }
        return result
    }
}

// MARK: - PhotosModel Mock Factory
extension PhotosModel {

    static func mock(
        id: String,
        author: String = "Mock Author",
        width: Int = 300,
        height: Int = 300
    ) -> PhotosModel {
        PhotosModel(
            id: id,
            author: author,
            width: width,
            height: height,
            url: "https://example.com",
            downloadURL: "https://picsum.photos/id/\(id)/300/300"
        )
    }
}
