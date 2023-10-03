import SwiftUI
import SwiftData

struct ScrumsView: View{
    @Environment(\.modelContext) private var modelContext
    @Query private var scrums: [DailyScrum]
    @State private var isPresentingAddView = false
    var body: some View{
        
        NavigationStack {
            List{
                
                ForEach(scrums) { scrum in
                    NavigationLink(destination: DetailView(scrum: scrum))
                    {
                        CardView(scrum: scrum)
                        
                    }
                    .listRowBackground(scrum.theme.mainColor)
                    
                }
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Button(action: { isPresentingAddView = true }) {
                        Image(systemName: "plus")
                    }
                    .accessibilityLabel("New Scrum")
                }
                
            }
            .sheet(isPresented: $isPresentingAddView) {
                NavigationStack{
                    AddView(scrum: DailyScrum.emptyScrum)
                        .navigationTitle("Add New Scrum")

                }
            }
        }
       
    }
    

}

struct ScrumsView_Preview: PreviewProvider{
    static var previews: some View{
        NavigationStack {
            ScrumsView()
                .modelContainer(previewContainer)
        }
    }
}



