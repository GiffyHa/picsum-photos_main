//
//  ApiService.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import Foundation

enum APIServiceError: LocalizedError {
    case invalidURL
    case serverError
    case decodingFailed
    case network

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .serverError:
            return "Server error. Please try again later."
        case .decodingFailed:
            return "Failed to process server response."
        case .network:
            return "Network connection error."
        }
    }
}

protocol PicsumAPIClient {
    func getPhotos(page: Int, limit: Int) async throws -> [PhotosModel]
}

final class PicsumAPIClientImpl: PicsumAPIClient {

    private let baseURL = "https://picsum.photos"

    func getPhotos(page: Int, limit: Int) async throws -> [PhotosModel] {
        var components = URLComponents(string: "\(baseURL)/v2/list")
        components?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(limit))
        ]

        guard let url = components?.url else {
            throw APIServiceError.invalidURL
        }

        do {
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw APIServiceError.serverError
            }

            return try JSONDecoder().decode([PhotosModel].self, from: data)
        } catch is DecodingError {
            throw APIServiceError.decodingFailed
        } catch {
            throw APIServiceError.network
        }
    }
}
