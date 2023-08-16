//
//  SamplePhoto.swift
//  UIKit-SwiftUI
//
//  Created by Sachin Daingade on 16/08/23.
//

import Foundation

// MARK: - SamplePhoto
struct SamplePhoto: Codable {
    let success: Bool
    let totalPhotos: Int
    let message: String
    let offset: Int
    let limit: Int
    let photos: [Photo]
    
    enum CodingKeys: String, CodingKey {
        case success
        case totalPhotos = "total_photos"
        case message, offset, limit, photos
    }
}

// MARK: - Photo
struct Photo: Codable,Identifiable {
    let description: String
    let id: Int
    let url: String
    let title: String
    let user: Int
}

//https://api.slingacademy.com/v1/sample-data/photos
