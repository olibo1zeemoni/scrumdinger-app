//
//  SwiftDataViewer.swift
//  Scrumdinger
//
//  Created by Olibo moni on 06/10/2023.
//

import SwiftUI
import SwiftData



struct SwiftDataViewer<Content: View>: View {
    
    private let content: Content
    private let preview: PreviewContainer
    private let items: [any PersistentModel]?
    
    init(preview: PreviewContainer,items: [ any PersistentModel]? = nil, @ViewBuilder _ content: () -> Content) {
        self.preview = preview
        self.items = items
        self.content = content()
    }
    
    var  body: some View {
        content
            .modelContainer (preview.container!)
            .onAppear (perform: {
                if let items {
                    preview.add(items: items)
                }
            })
    }
}

struct PreviewContainer {
    let container: ModelContainer?
    
    init(types: [any PersistentModel.Type], isStoredInMemoryOnly: Bool = true) {
        let schema = Schema(types)
        let config = ModelConfiguration(isStoredInMemoryOnly: isStoredInMemoryOnly)
        self.container = try? ModelContainer(for: schema, configurations: config)
        
    }
    
    
    
    
     func add (items: [any PersistentModel]) {
        Task { @MainActor in
            items.forEach { container?.mainContext.insert($0)
                
            }
            
        }
    }
    
}
