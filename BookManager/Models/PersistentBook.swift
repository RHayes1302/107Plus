//
//  PersistentBook.swift
//  BookManager
//
//  Created by Wendell Richards on 12/13/25.
//

import SwiftData

@Model
class PersistentBook {
    var title: String
    var author: String
    var summary: String
    
    var review: String
    var status: ReadingStatus
    var rating: Int
    var genre: Genre
    var isFavorite: Bool
    
    init(title: String,
         author: String="",
         summary: String="",
         review: String="",
         status: ReadingStatus = .unknown,
         rating: Int=0,
         genre: Genre = .unknown,
         isFavorite: Bool = false)
    {
        self.title = title
        self.author = author
        self.summary = summary
        self.review = review
        self.status = status
        self.rating = rating
        self.genre = genre
        self.isFavorite = isFavorite
    }
    

}
