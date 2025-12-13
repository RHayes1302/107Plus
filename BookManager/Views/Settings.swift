//
//  Settings.swift
//  BookManager
//
//  Created by Wendell Richards on 12/11/25.
//

import SwiftUI

struct Settings: View {
    @AppStorage(SETTINGS_THEME) private var selectedTheme: Theme = .system
    @AppStorage(SETTINGS_GRID_COLUMNS) private var gridColumns: Int = 2
    @AppStorage(SETTINGS_ACCENT_COLOR) private var accentColor: Color = .accentColor
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Appearance")){
                    Picker("Theme", selection: $selectedTheme){
                        ForEach(Theme.allCases, id: \.self) { theme in
                            Text(theme.rawValue.capitalized).tag(theme)
                        }
                    }
                    ColorPicker("Accent Color", selection: $accentColor)
                }
                Section(header: Text("Grid")){
                    Stepper("Columns: \(gridColumns)", value: $gridColumns, in: 1...4)
                }
            }
            .navigationTitle(Text("Settings"))
        }
    }
}
