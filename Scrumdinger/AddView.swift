//
//  AddView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 03/10/2023.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Bindable var scrum: DailyScrum
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var newAttendee = ""

    
    var body: some View {
        Form{
            Section("Meeting Info") {
                TextField("Title", text: $scrum.title)
                HStack {
                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                        Text("Length")
                    }
                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                        .accessibilityHidden(true)
                }
                
                ThemePicker(selection: $scrum.theme)
                   .accessibilityLabel(Text("Theme Picker"))
            }
            
            Section("attendees"){
                ForEach(scrum.attendees) {attendee in
                    Text(attendee.name)
                    
                }
            
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrum.attendees.append(DailyScrum.Attendee(name: newAttendee))
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel("Add attendee")
                    }
                    .disabled(newAttendee.isEmpty)
                }
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("save") {
                    
                    modelContext.insert(scrum)
                    dismiss()
                }
                .disabled(disable)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("cancel") {
                    dismiss()
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        
    }
    
    var disable: Bool {
        guard !scrum.title.isEmpty else { return true }
        guard !scrum.attendees.isEmpty else { return true }
        return false
    }
}

#Preview {
    let previewContainer: ModelContainer = {
        do {
            let container = try ModelContainer(for: DailyScrum.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
            
            let modelContext = container.mainContext
                for scrum in DailyScrum.sampleData {
                    modelContext.insert(scrum)
                }
            return container
        } catch {
            fatalError("Failed to create container")
        }
    }()
   return AddView(scrum: DailyScrum.sampleData[0])
        .modelContainer(previewContainer)
}
