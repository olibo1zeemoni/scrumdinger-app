import SwiftUI

struct DailyScrum: Identifiable, Codable {
    let id: UUID
    var title : String
    var attendees : [Attendee]
    var lengthInMinutes : Int
    var theme : Theme
    var history = [History]()
    
    var lengthInMinutesAsDouble: Double {
        get {
            Double(lengthInMinutes)
        }
        set {
            lengthInMinutes = Int(newValue)
        }
    }
    
    
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme){
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0)}
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
        
    }
    
    static var emptyScrum: DailyScrum {
        return DailyScrum(title: "", attendees: [], lengthInMinutes: 5, theme: .sky)
      }
    
//    enum CodingKeys : String, CodingKey {
//        case id = "id"
//        case title = "title"
//        case attendees = "attendees"
//        case lengthInMinutes = "lenghtInMinutes"
//        case theme = "theme"
//        
//        
//    }
}

extension DailyScrum {
    static let sampleData: [DailyScrum] =
        [
            DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .periwinkle),
            DailyScrum(title: "App Dev", attendees: ["Katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .buttercup),
            DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Christina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .seafoam)
        ]
    
}



extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        init(id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
}
