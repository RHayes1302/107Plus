//
//  ImageField.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/13/25.
//

import SwiftUI
import PhotosUI

struct ImageField: View {
    @Binding var image: UIImage?
    @State private var photoPickerItem: PhotosPickerItem?
    
    var body: some View {
        PhotosPicker(
            selection: $photoPickerItem,
            matching: .images,
            photoLibrary: .shared()
        ){
            Image(uiImage: image ?? UIImage(resource: .defaultBook))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                
        }.onChange(of: photoPickerItem) { _, newValue in
            Task{
                if let photoPickerItem,
                   let imageData = try? await photoPickerItem.loadTransferable(type:Data.self){
                    if let image = UIImage(data: imageData) {
                        self.image = image
                    }
                }
            }
        }
    }
}
