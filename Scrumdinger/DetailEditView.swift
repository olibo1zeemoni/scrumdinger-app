//
//  EditView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 05/11/2021.
//

import SwiftUI

struct DetailEditView: View {
    @State private var newAttendee = ""
    @Binding var scrum: DailyScrum
    
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
                .onDelete{ Indices in
                    scrum.attendees.remove(atOffsets: Indices)
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
        .listStyle(InsetGroupedListStyle())
        
    }
}


struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        DetailEditView(scrum: .constant(DailyScrum.sampleData[0]))
            .preferredColorScheme(.dark)
    }
}
