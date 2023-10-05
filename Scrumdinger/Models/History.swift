//
//  History.swift
//  Scrumdinger
//
//  Created by Olibo moni on 04/10/2023.
//

import Foundation

struct History: Identifiable, Codable {
    let id: UUID
    let date: Date
    let attendee: [DailyScrum.Attendee]
    
    init(id: UUID = UUID(), date: Date = Date(), attendee: [DailyScrum.Attendee]) {
        self.id = id
        self.date = date
        self.attendee = attendee
    }
}
