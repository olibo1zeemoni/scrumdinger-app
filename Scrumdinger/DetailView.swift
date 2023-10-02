//  Created by Olibo moni on 04/11/2021.
//


import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var isPresentingEditView = false
<<<<<<< HEAD
    @State private var editingScrum = DailyScrum.emptyScrum
    
=======
>>>>>>> refs/remotes/origin/master
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
<<<<<<< HEAD
                editingScrum = scrum
=======
                //data = scrum.emptyScrum
>>>>>>> refs/remotes/origin/master
            }
        }
        .navigationTitle(scrum.title)
        .sheet(isPresented: $isPresentingEditView) {
            NavigationStack {
<<<<<<< HEAD
                DetailEditView(scrum: $editingScrum)
=======
                DetailEditView(scrum: $scrum)
>>>>>>> refs/remotes/origin/master
                    .navigationTitle(scrum.title)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Cancel") {
                                isPresentingEditView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
<<<<<<< HEAD
                                isPresentingEditView = false
                                scrum = editingScrum
=======
                                
                                isPresentingEditView = false 
>>>>>>> refs/remotes/origin/master
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
            DetailView(scrum: .constant(DailyScrum.sampleData[0]))
        }
    }
}
