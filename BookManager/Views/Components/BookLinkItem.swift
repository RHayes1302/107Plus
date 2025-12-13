//
//  BookLinkItem.swift
//  BookManager
//
//  Created by Wendell Richards on 11/22/25.
//
import SwiftUI

struct BookLinkItem: View {
     let book: PersistentBook
    
    var body: some View {
        HStack{
            Image(uiImage: (book.coverImage != nil ? UIImage(data: book.coverImage!)! : UIImage(resource: .defaultBook)))
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 60, maxHeight: 60)
            VStack(alignment: .leading ){
                Text(book.title)
                Text(book.author)
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}
