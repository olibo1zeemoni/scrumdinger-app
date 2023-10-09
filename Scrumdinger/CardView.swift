import SwiftUI
import SwiftData

struct CardView: View{
    let scrum: DailyScrum
    var body: some View{
        VStack(alignment: .leading){
            Text(scrum.title)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            
            Spacer()
            HStack{
                Label("\(scrum.attendees.count)",systemImage: "person.3")
                    .accessibilityLabel("\(scrum.attendees.count) attendees")
                
                Spacer()
                Label("\(scrum.lengthInMinutes)", systemImage: "clock")
                    .labelStyle(.trailingIcon)
                    .accessibilityLabel("\(scrum.lengthInMinutes) minute meeting")
            }
            .font(.caption)
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
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
    var scrum = DailyScrum.sampleData[0]
    
    return CardView(scrum: scrum)
        .background(scrum.theme.mainColor)
        .previewLayout(.fixed(width: 400, height: 60))
        .modelContainer(previewContainer)
    
}
