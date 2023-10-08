//
//  TimeLineView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 07/10/2023.
//

import SwiftUI

struct ExampleView: View {
    var body: some View {
        VStack {
            TimelineView(.animation) { context in
                    let value = secondsValue(for: context.date)
                    Circle()
                    .trim(from: 0, to: value)
                        .stroke()
                        
            }
        }
        .padding()
        }

        private func secondsValue(for date: Date) -> Double {
            let seconds = Calendar.current.component(.second, from: date)
            //print("\(Double(seconds)/60)")
            return Double(seconds) / 60
        }
}

#Preview {
    ExampleView()
}
