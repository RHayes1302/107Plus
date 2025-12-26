//
//  FilterView.swift
//  BookManager
//
//  Created by Ramone Hayes on 12/9/25.
//

import SwiftUI

struct FilterView: View {
    
    @Binding var selectedGenre: Genre?
    @Binding var selectedReadingStatus: ReadingStatus?
    @State private var workingSelectedGenre: Genre?
    @State private var workingSelectedReadingStatus: ReadingStatus?
    
    @Environment(\.dismiss) private var dismiss
    // This is ran only on creation
    
    init(selectedGenre: Binding<Genre?>, selectedStatus: Binding<ReadingStatus?>){
        self._selectedGenre = selectedGenre
        self._workingSelectedGenre = .init(initialValue: selectedGenre.wrappedValue)
        self._selectedReadingStatus = selectedStatus
        self._workingSelectedReadingStatus = .init(initialValue: selectedStatus.wrappedValue)
    }
    
    var body: some View {
        NavigationStack{
            
            
            Form{
                Section(header:Text("Filter by genre")){
                Picker("Genre", selection: $selectedGenre){
                    Text("Select a genre").tag(nil as Genre?)
                    ForEach(Genre.allCases, id: \.self){ genre in
                        Text(genre.rawValue).tag(genre)
                    }
                }
            }
                Section(header: Text("Filter by status")){
                    Picker("Reading Status", selection: $selectedReadingStatus){
                        Text("Select a status").tag(nil as ReadingStatus?)
                        ForEach(ReadingStatus.allCases, id: \.self){ status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                }
            }.navigationBarItems(leading: Button("Clear "){
               $selectedGenre.wrappedValue = .unknown
                $selectedReadingStatus.wrappedValue = .unknown
                dismiss()
            } )
            .navigationBarItems(trailing: Button("Apply"){
                dismiss()
            })
                    
        }
        
                    
        
    }
}
