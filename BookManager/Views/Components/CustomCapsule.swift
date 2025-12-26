//
//  CustomCapsule.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/2/25.
//

import SwiftUI

struct CustomCapsule: View {
    //properties go here
    
    var text: String
    var color = Color.accentColor // this prop is a default value so it is optional
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.bold)
            .padding(8)
            .background(color.opacity(0.25))
            .clipShape(Capsule())
    }
}
#Preview {
    CustomCapsule(text: "hopeful", color: .yellow)
}
