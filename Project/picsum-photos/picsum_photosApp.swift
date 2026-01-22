//
//  picsum_photosApp.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import SwiftUI

@main
struct picsum_photosApp: App {
    var body: some Scene {
        WindowGroup {
            let apiClient = PicsumAPIClientImpl()
            let repository = PhotosRepositoryImpl(apiClient: apiClient)
            let useCase = GetPhotosUseCaseImpl(repository: repository)
            let viewModel = PhotosViewModel(getPhotosUseCase: useCase)

            TabComponents(viewModel: viewModel)
        }
    }
}
