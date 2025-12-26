//
//  ReadingStatus.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/2/25.
//

// This is an enum that will be used ro determine all the possible
// reading statuses, se we know what books I want to read, which one I'm currently reading or which i have finished.

// Value is saved as a string
// Implements case Iterable protocol so we can iterate through cases
// Hashable makes them easy to access
// Codable makes it possible to save them in JSON format

import Foundation

enum ReadingStatus: String, CaseIterable, Hashable, Codable {
    case planToRead = "Plan to Read"
    case reading = "Reading"
    case dropped = "Dropped"
    case finished = "Finished"
    // Base Case
    case unknown = "Unknown"
}
