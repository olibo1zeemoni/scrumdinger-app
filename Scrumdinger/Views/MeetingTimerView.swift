//
//  MeetingTimerView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 06/10/2023.
//

import SwiftUI

struct MeetingTimerView: View {
    let theme: Theme
    let speakers: [ScrumTimer.Speaker]
    let secondsElapsedForSpeaker: Int
    
    var currentSpeakerName: String {
        speakers.first(where: {!$0.isCompleted})?.name ?? "No One"
    }
    
    var currentSpeaker: ScrumTimer.Speaker {
        speakers.first(where: {!$0.isCompleted})!
    }
    
    var body: some View {
       // TimelineView(.animation) { context in
            //let value = secondsValue(for: context.date)
            
            Circle()
                .strokeBorder(lineWidth: 24, antialiased: true)
                .overlay(alignment: .center) {
                    
                    VStack {
                        Text(currentSpeakerName)
                            .font(.title)
                        Text("is speaking")
                    }
                    .accessibilityElement(children: .combine)
                    .foregroundStyle(theme.accentColor)
                }
                .overlay
            {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted {
                        let index = speakers.firstIndex(where: { $0.id == speaker.id })
                        SpeakerArc(speakerIndex: index!, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90))
                        
                            .stroke(theme.mainColor, lineWidth: 12)
                    }
                }
            }
            .overlay {
                SpeakerArc(speakerIndex: speakers.firstIndex(where: { $0.id == currentSpeaker.id })!, totalSpeakers: speakers.count)
                    .rotation(Angle(degrees: -90))
                    .trim(from: 0, to: CGFloat(secondsElapsedForSpeaker / 60))
                    .stroke(theme.mainColor, lineWidth: 12)
                    
            }
            .padding(.horizontal)
            .onChange(of: secondsElapsedForSpeaker) { seconds in
                //print(seconds)
               // returnFraction()
            }
        
    }
    
    func returnFraction()  {
       //CGFloat(secondsElapsedForSpeaker)
        print("\(secondsElapsedForSpeaker) seconds")
        //return CGFloat(secondsElapsedForSpeaker)
    }
    
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
}

#Preview {
    var speakers: [ScrumTimer.Speaker] {
        [ScrumTimer.Speaker(name: "Bill", isCompleted: true), ScrumTimer.Speaker(name: "Cathy", isCompleted: false), ScrumTimer.Speaker(name: "Mike", isCompleted: false)]
    }
    return MeetingTimerView(theme: .bubblegum, speakers: speakers, secondsElapsedForSpeaker: 30)
}
