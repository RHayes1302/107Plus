//
//  BookListView.swift
//  BookManager
//
//  Created by Wendell Richards on 12/4/25.
//
import SwiftUI
import SwiftData

struct BookListView: View {
    @Query var books: [PersistentBook]
    @State var showAddBookSheet: Bool = false
    @State var newBook = Book(title:"", author: "", details: "")

    var body: some View {
        NavigationStack{
            List(books, id: \.self.id){ book in
                NavigationLink(destination: DetailView(book: book)){
                    BookLinkItem(book: book)
                }
                
            }.navigationBarTitle("Book Manager")
             .navigationBarItems(trailing: Button("Add Book"){
                    showAddBookSheet.toggle()
                })
             .sheet(isPresented: $showAddBookSheet){
//                 if(!newBook.title.isEmpty){
//                     books.append(newBook)
//                 }
//                 newBook = Book(title:"", author: "", details: "")
             }
            content: {
                    AddEditView(bookToEdit: $newBook)
                }
        }
    }
}
