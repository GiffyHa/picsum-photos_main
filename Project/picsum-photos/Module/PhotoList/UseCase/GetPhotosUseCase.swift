//
//  GetPhotosUseCase.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import Foundation

protocol GetPhotosUseCase {
    func execute(page: Int, limit: Int) async throws -> [PhotosModel]
}

final class GetPhotosUseCaseImpl: GetPhotosUseCase {

    private let repository: PhotosRepository

    init(repository: PhotosRepository) {
        self.repository = repository
    }

    func execute(page: Int, limit: Int) async throws -> [PhotosModel] {
        do {
            return try await repository.fetchPhotos(page: page, limit: limit)
        } catch {
            throw error
        }
    }
}
