//
//  ArtistsLoader.swift
//  artist-gallery-ios
//
//  Created by  Maksim Stogniy on 01.06.2024.
//

import Foundation

class ArtistsLoader {
    func loadArtists(from filename: String) -> [Artist]? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json") else {
            print("Не удалось найти файл \(filename).json")
            return nil
        }

        do {
            let data = try Data(contentsOf: url)
            let artistsData = try JSONDecoder().decode(ArtistsData.self, from: data)
            return artistsData.artists
        } catch {
            print("Ошибка при чтении файла \(filename).json: \(error)")
            return nil
        }
    }
}
