//
//  FavoritesView.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/4/25.
//

import SwiftUI

struct FavoritesView: View {
    @AppStorage(SETTINGS_GRID_COLUMNS) var gridColumns: Int = 2
    
    @Binding var books: [Book]
    
    @State var selectedGenre: Genre?
    @State var selectedReadingStatus: ReadingStatus?
    
//    var gridLayout: [GridItem] = {
//        Array(repeating: GridItem(.flexible()), count: gridColumns)
//    }
//    
    @State private var isFilterSheetPresented: Bool = false
    
    //Computed Variable -> as soon as books binding variable changes the new variable will compute itself to match the state
    
    private var favoriteBooks: [Binding<Book>]{
        $books.filter {$0.wrappedValue.isFavorite
            && (selectedGenre == nil || $0.wrappedValue.genre == selectedGenre)
            && (selectedReadingStatus == nil || $0.wrappedValue.status == selectedReadingStatus)
        }
    }
    
    
    var body: some View {
        NavigationStack{
            ScrollView {
                HStack{
                    if(selectedGenre != nil){
                        Text("Genre: \(selectedGenre!.rawValue)")
                    }
                    if (selectedReadingStatus != nil){
                        Text("Status: \(selectedReadingStatus!.rawValue)")
                    }
                }

//                LazyVGrid(columns: gridLayout) {
//                    ForEach(favoriteBooks, id: \.id) { book in
//                        NavigationLink(destination: DetailView(book: book)){
//                            BookCard(book: book)
//                        }
//                    }
//                    
//                }.padding(.horizontal)
            }.navigationBarTitle("My Favorite Books")
                .padding(20)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action:{isFilterSheetPresented.toggle()}){
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundStyle(Color(.blue))
                        }
                    }
                }
                .sheet(isPresented: $isFilterSheetPresented){
                    FilterView(selectedGenre: $selectedGenre, selectedStatus: $selectedReadingStatus)
                }
            
        }
    }
}
