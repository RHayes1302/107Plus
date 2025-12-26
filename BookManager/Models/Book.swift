//
//  Book.swift
//  BookManager
//
//  Created by Ramone Hayes on 11/22/25.
//

import Foundation

struct Book: Identifiable {
    let id: UUID = UUID()
    var title: String
    var author: String
    var coverImage: String = "default_book"
    var details: String
    
    var review: String = ""
    var status: ReadingStatus = .unknown
    var rating: Int = 0 //default rating
    var genre: Genre = .unknown
    
    var isFavorite: Bool = false
}
