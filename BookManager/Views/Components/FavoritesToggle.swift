//
//  FavoritesToggle.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/4/25.
//

import SwiftUI

struct FavoritesToggle: View {
    @Binding var isFavorite: Bool
    @State private var opacity: CGFloat = 0
    @State private var scale: CGFloat = 1
    @State private var offsetY: CGFloat = 0
    
    var body: some View {
        ZStack {
            //Background Image that is going to be animated
            Image(systemName: "heart.fill" )
                .foregroundColor(.red)
                .font(.largeTitle)
                .opacity(opacity)
                .scaleEffect(scale)
                .offset(y: offsetY)
            
            Toggle(isOn: $isFavorite){
                Image(systemName: isFavorite ? "heart.fill" :"heart")
                    .foregroundStyle(isFavorite ? .red : .secondary)
            }
            .toggleStyle(.button)
            .buttonStyle(.plain)
            .animation(Animation.spring(), value: isFavorite)
            .accessibilityLabel(isFavorite ? Text("Remove from Favorites") : Text("Add to Favorites"))
            .onChange(of: isFavorite) { oldvalue, newValue in
                guard newValue else { return }
                
                withAnimation(.spring(response:0.5, dampingFraction:0.4)){
                    opacity = 1
                    scale = 1.2
                }
                withAnimation(.easeInOut(duration:0.5).delay(0.3)){
                    opacity = 0
                    offsetY = -100
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    scale = 1
                    offsetY = 0
                }
            }
        }
    }
}
