//
//  AddEditView.swift
//  BookManager
//
//  Created by  Ramone Hayes 11/25/25.
//
import SwiftUI
import SwiftData

struct AddEditView: View {
    
    private var bookToEdit: PersistentBook?
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext   
    
    @State var title: String
    @State var author: String 
    @State var summary: String
    
    @State var review: String
    @State var status: ReadingStatus
    @State var rating: Int
    @State var genre: Genre
    @State var isFavorite: Bool
    @State var cover: UIImage? = nil
        
    
    
    private var titleText: String
    // This is ran only on creation
    init(book: PersistentBook? = nil){
        self.bookToEdit = book
        
        if let book {
            self.titleText = "Edit Book"
            self.title = book.title
            self.author = book.author
            self.summary = book.summary
            self.review = book.review
            self.status = book.status
            self.rating = book.rating
            self.genre = book.genre
            self.isFavorite = book.isFavorite
            if let coverData = book.coverImage {
//                convert type data to UIImage
                self.cover = UIImage(data: coverData)
            }
        } else {
            self.titleText = "Add Book"
            self.title = ""
            self.author = ""
            self.summary = ""
            self.review = ""
            self.status = .unknown
            self.rating = 0
            self.genre = .unknown
            self.isFavorite = false
            self.cover = nil
            
        }
    }
    var body: some View {
        NavigationStack{
            Form{
                Section(header: Text("Book Cover")){
                    ImageField(image: $cover)
                }
                
               // Section creates a "white glove around all input fields
                // Uses divide fields
                Section(header: Text("Book Details")){
                    // a plain text field
                    TextField("Title of the book", text: $title)
                    TextField("Author", text: $author)
                    Picker("Genre", selection: $genre){
                        ForEach(Genre.allCases, id: \.self) {
                            genre in Text(genre.rawValue).tag(genre)
                        }
                    }
                    TextEditor(text: $summary)
                        .frame(height: 150)
                }
                Section(header: Text("My Review")){
                    Picker("Rating", selection: $rating){
                        Text("No Rating").tag(0 as Int)
                        ForEach(1...5, id: \.self){rating in
                            Text("\(rating)").tag(rating as Int)
                        }
                    }
                    Picker("Reading Status", selection: $status){
                        //Enums hace a special property 'allCases'
                        ForEach(ReadingStatus.allCases, id: \.self){status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    TextEditor(text: $review)
                        .frame(height: 150)
                }
            }.navigationBarTitle(titleText)
                .toolbar{
                    ToolbarItem(placement: .confirmationAction){
                        Button("Save Book"){
                            
                            let isNewBook = bookToEdit == nil
                            let booktoSave = bookToEdit ?? PersistentBook(title:"")
                            booktoSave.title = title
                            booktoSave.author = author
                            booktoSave.summary = summary
                            booktoSave.review = review
                            booktoSave.status = status
                            booktoSave.rating = rating
                            booktoSave.genre = genre
                            booktoSave.isFavorite = isFavorite
                            if cover != nil {
                                booktoSave.coverImage =
                                cover?.jpegData(compressionQuality: 1)
                            }
                            
                            if isNewBook {
                                modelContext.insert(booktoSave)
                            }
                            do {
                                try modelContext.save()
                            }catch{
                                print("Failure saving book: \(error)")
                            }
                            
                            dismiss()
                        }.disabled(title.isEmpty)
        
                }
            }
            
        }
        
    }
}
