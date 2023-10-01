//  Created by Olibo moni on 04/11/2021.
//


import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    @State private var data: DailyScrum.Data = DailyScrum.Data()
    @State private var isPresented = false
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
                        .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)), style: FillStyle())
                }
                .accessibilityElement(children: .combine)
            }
            
            
            Section(header: Text("Attendees")){
                ForEach(scrum.attendees) {attendee in
                    Label(attendee.name, systemImage: "person")
                        .accessibilityLabel(attendee.name + "Person")
                }
            }
        }
        .listStyle(InsetGroupedListStyle())
        .toolbar {
            Button("Edit"){
                isPresented = true
                data = scrum.data
            }
        }
        .navigationTitle(scrum.title)
        .fullScreenCover(isPresented: $isPresented) {
            NavigationView {
                EditView(scrumData: $data)
                    .navigationTitle(scrum.title)
                    .navigationBarItems(leading: Button("Cancel") {
                        isPresented = false
                    }, trailing: Button("Done") {
                        isPresented = false
                        scrum.update(from: data)
                    })
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
