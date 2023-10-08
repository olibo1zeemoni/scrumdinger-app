//  Created by Olibo moni on 04/11/2021.
//


import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresentingEditView = false
    @State private var editingScrum = DailyScrum.emptyScrum
    
    var disabled: Bool {
        guard scrum.attendees.isEmpty else { return true }
        return false
    }
    
    var body: some View {
        List {
            Section("Meeting Info") {
                NavigationLink(
                    destination: MeetingView(scrum: $scrum)) {
                    Label("Start meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                        .accessibilityLabel(Text("Start Meeting"))
                    }    
                    .disabled(!disabled)
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
            
            Section("Attendees"){
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                        .accessibilityLabel("Attendee" + attendee.name)
                }
            }
            
            Section("History") {
                if scrum.history.isEmpty {
                    Label("No meetings yet", systemImage: "calendar.badge.exclamationmark")
                }
                ForEach(scrum.history) { history in
                    NavigationLink {
                        HistoryView(history: history)
                    } label: {
                        HStack {
                            Image(systemName: "calendar")
                            Text(history.date, style: .date)
                        }
                    }

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
                                isPresentingEditView = false
                                scrum = editingScrum

                            }
                        }
                    }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(scrum: .constant(DailyScrum.sampleData[2]))
        }
    }
}
