//
//  Artists.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

import Foundation

struct Work: Codable {
    let title: String
    let image: String
    let info: String
}

struct Artist: Codable {
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct ArtistsData: Codable {
    let artists: [Artist]
}
