import SwiftUI

struct ScrumsView: View{
    @Binding var scrums: [DailyScrum]
    @Environment(\.scenePhase) var scenePhase
    @State private var isPresentingNewScrumView = false
    let saveAction: () -> Void
    
    var body: some View{
        NavigationStack {
            List{
                ForEach($scrums) {$scrum in
                    NavigationLink(destination: DetailView(scrum: $scrum))
                    {
                        CardView(scrum: scrum)
                        
                    }
                    .listRowBackground(scrum.theme.mainColor)
                    
                }
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {
                    isPresentingNewScrumView = true
                }) {
                Image(systemName: "plus")
            }
            .accessibilityLabel("New Scrum")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewScrumSheet(scrums: $scrums, isPresentingNewScrumView: $isPresentingNewScrumView)
        }
        .onChange(of: scenePhase) { phase,_ in
            if phase == .inactive {
                saveAction()
            }
        }
        
    }
}

struct ScrumsView_Preview: PreviewProvider{
    static var previews: some View{
        NavigationStack {
            ScrumsView(scrums: .constant(DailyScrum.sampleData), saveAction: { })
        }
    }
}

//func someView(index: Int){
//    CardView(scrum: DailyScrum.data[index])
//}

