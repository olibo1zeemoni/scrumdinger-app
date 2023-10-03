//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Olibo moni on 03/11/2021.
//

import SwiftUI
import SwiftData

var sharedModelContainer: ModelContainer = {
    let schema = Schema([DailyScrum.self])
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    
    do {
        return try ModelContainer(for: schema, configurations: modelConfiguration)
    } catch {
        fatalError("Could not create ModelContainer: \(error)")
    }
}()

@main
struct ScrumdingerApp: App {
    //@State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView()
        }
        .modelContainer(sharedModelContainer)
    }
}
