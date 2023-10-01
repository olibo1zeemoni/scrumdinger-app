import SwiftUI

struct ScrumsView: View{
    @Binding var scrums: [DailyScrum]
    var body: some View{
        
        NavigationStack {
            List{
                
                //CardView(scrum: DailyScrum.data[0])
                //CardView(scrum: DailyScrum.data[1])
                //CardView(scrum: DailyScrum.data[2])
                
                ForEach(scrums) {scrum in
                    NavigationLink(destination: DetailView(scrum: binding(for: scrum)))
                    {
                        CardView(scrum: scrum)
                        
                    }
                    .listRowBackground(scrum.theme.mainColor)
                    
                }
            }
            .navigationTitle("Daily Scrums")
        }
        .toolbar { Button(action: {}) {
            Image(systemName: "plus")
        }
        .accessibilityLabel("New Scrum")
        }
    }
    
    private func binding(for scrum: DailyScrum)-> Binding<DailyScrum>{
        guard let scrumIndex = scrums.firstIndex(where: { $0.id == scrum.id }) else {
            fatalError("Can't find scrum in array")
        }
        return $scrums[scrumIndex]
    }
}

struct ScrumsView_Preview: PreviewProvider{
    static var previews: some View{
        NavigationStack {
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
        }
        .preferredColorScheme(.dark)
    }
}

//func someView(index: Int){
//    CardView(scrum: DailyScrum.data[index])
//}

