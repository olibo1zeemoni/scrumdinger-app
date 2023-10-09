//  Created by Olibo moni on 04/11/2021.
//


import SwiftUI
import SwiftData

struct DetailView: View {
    var scrum: DailyScrum
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var body: some View {
        List {
            Section(header: Text("Meeting Info")) {
                NavigationLink(
                    destination: MeetingView()) {
                        Label("Start meeting", systemImage: "timer")
                            .font(.headline)
                            .foregroundColor(.accentColor)
                            .accessibilityLabel(Text("Start Meeting"))
                    }
                
                HStack{
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                
                HStack{
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10)))
                }
                .accessibilityElement(children: .combine)
            }
            
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                        .accessibilityLabel("Attendee" + attendee.name)
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            Button("Edit"){
                isPresentingEditView = true
                editingScrum = scrum
            }
        }
        .navigationTitle(scrum.title)
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                                
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                //scrum = editingScrum
                                
                                isPresentingEditView = false
                            }
                        }
                    }
            }
        }
    }
}

#Preview("DetailView") {
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
    return NavigationStack {
        DetailView(scrum: DailyScrum.sampleData[1])
            .modelContainer(previewContainer)
    }
}
