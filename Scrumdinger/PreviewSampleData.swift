//
//  PreviewSampleData.swift
//  Scrumdinger
//
//  Created by Olibo moni on 03/10/2023.
//

import SwiftData

@MainActor
let previewContainer: ModelContainer = {
    do {
        let container = try ModelContainer(for: DailyScrum.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        let modelContext = container.mainContext
        if try modelContext.fetch(FetchDescriptor<DailyScrum>()).isEmpty {
            
            for scrum in DailyScrum.sampleData {
                container.mainContext.insert(scrum)
            }
        }
        
        return container
    } catch {
        fatalError("Failed to create container")
    }
}()
