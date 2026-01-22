//
//  PhotosRepository.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import Foundation

protocol PhotosRepository {
    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotosModel]
}

final class PhotosRepositoryImpl: PhotosRepository {

    private let apiClient: PicsumAPIClient

    init(apiClient: PicsumAPIClient) {
        self.apiClient = apiClient
    }

    func fetchPhotos(page: Int, limit: Int) async throws -> [PhotosModel] {
        try await apiClient.getPhotos(page: page, limit: limit)
    }
}
