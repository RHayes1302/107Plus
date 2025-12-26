//
//  Genre.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/2/25.
//

enum Genre: String, CaseIterable, Hashable, Codable {
    case classic = "Classic"
    case fantasy = "Fantasy"
    case scienceFiction = "Science Fiction"
    case horror = "Horror"
    case romance = "Romantic"
    // Base Case
    case unknown = "Unknown"
}
