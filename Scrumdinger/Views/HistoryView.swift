//
//  HistoryView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 08/10/2023.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                if let transcript = history.transcript {
                    Text(transcript)
                        .font(.headline)
                        .padding(.top)
                }
            }
        }
        .navigationTitle(Text(history.date, style: .date))
        .padding()
    }
}

extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map{ $0.name })
    }
}

#Preview {
     var history: History {
            History(attendees: [
                DailyScrum.Attendee(name: "Jon"),
                DailyScrum.Attendee(name: "Darla"),
                DailyScrum.Attendee(name: "Luis")
            ],
                    transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI...")
        }
   return HistoryView(history: history)
}
