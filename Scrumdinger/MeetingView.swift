//
//  ContentView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 03/11/2021.
//

import SwiftUI

struct MeetingView: View {
    var body: some View {
        VStack {
           
            ProgressView(value:10, total: 30)
            HStack{
                VStack(alignment: .leading) {
                    Text(/*@START_MENU_TOKEN@*/"Seconds Elapsed"/*@END_MENU_TOKEN@*/)
                        .font(.caption)
                    Label("300", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                        //.foregroundColor(.yellow)
                    Label("600", systemImage: "hourglass.tophalf.fill")
                }
            }
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("Time Remaining"))
            .accessibilityValue(Text("10 minutes"))
            //.accessibleFontColor(foregroundColor(.black)
            
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
            HStack{
                Text("Speaker 1 of 3")
                Spacer()
                Button(action: {}) {
                    
                    Image(systemName: "forward.fill")
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(Text("Next Speaker"))
            
            }
            
        }
        .padding()
    }
}

struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView()
    }
}
