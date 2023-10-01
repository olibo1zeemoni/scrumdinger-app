//
//  EditView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 05/11/2021.
//

import SwiftUI

struct EditView: View {
    @Binding var scrumData: DailyScrum.Data
    @State private var newAttendee = ""
    var body: some View {
        List{
            Section(header: Text("meeting info")){
                TextField("Title", text: $scrumData.title)
                HStack{
                    Slider(value: $scrumData.lengthInMinutes, in: 5...30, step: 1.0){
                        Text("length")
                        
                    }
                    .accessibilityValue(Text("\(Int(scrumData.lengthInMinutes))minutes"))
                    Spacer()
                    Text("\(Int(scrumData.lengthInMinutes)) minutes")
                        .accessibilityHidden(true)
                        
                }
                
//                ColorPicker("Color", selection: $scrumData.theme.mainColor)
//                    .accessibilityLabel(Text("color Picker"))
            }
            
            Section(header: Text("attendees")){
                ForEach(scrumData.attendees) {attendee in
                    Text(attendee.name)
                                      
                }
                .onDelete{ Indices in
                    scrumData.attendees.remove(atOffsets: Indices)
                }
                HStack {
                    TextField("New Attendee", text: $newAttendee)
                    Button(action: {
                        withAnimation {
                            scrumData.attendees.append(DailyScrum.Attendee(name: newAttendee))
                            newAttendee = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .accessibilityLabel(Text("Add attendee"))
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
        EditView(scrumData: .constant(DailyScrum.sampleData[0].data))
            .preferredColorScheme(.dark)
    }
}
