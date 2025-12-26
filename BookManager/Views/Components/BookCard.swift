//
//  BookCard.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/4/25.
//

import SwiftUI

struct BookCard: View {
    @Binding var book: Book
    
    var body: some View {
        VStack() {
            Text(book.title)
                .frame(maxWidth: .infinity, maxHeight: 43)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .background(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.8)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                )
            Spacer()
            Text(book.author)
                .frame(maxWidth: .infinity, maxHeight: 20)
                .foregroundColor(.white)
                .font(.subheadline)
                .lineLimit(1)
                .padding(4)
                .background(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.8)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                
        
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image(book.coverImage)
                .resizable()
                .scaledToFill().opacity(0.8)
        )
        .aspectRatio(1, contentMode: .fit)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 5)
    }
}
