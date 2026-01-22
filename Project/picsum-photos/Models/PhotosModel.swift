//
//  PhotosModel.swift
//  picsum-photos
//
//  Created by giffy on 22/01/26.
//

import Foundation

struct PhotosModel: Codable, Identifiable, Hashable {
    let id: String
    let author: String
    let width: Int
    let height: Int
    let url: String
    let downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}
