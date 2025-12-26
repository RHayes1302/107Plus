//
//  PersistentBook.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/13/25.
//

import SwiftData
import Foundation

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
    
    var coverImage: Data?
    
    init(title: String,
         author: String="",
         summary: String="",
         review: String="",
         status: ReadingStatus = .unknown,
         rating: Int=0,
         genre: Genre = .unknown,
         isFavorite: Bool = false,
         coverImage: Data? = nil
    )
    {
        self.title = title
        self.author = author
        self.summary = summary
        self.review = review
        self.status = status
        self.rating = rating
        self.genre = genre
        self.isFavorite = isFavorite
        self.coverImage = coverImage
    }
    

}
