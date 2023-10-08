//
//  SpeakerArc.swift
//  Scrumdinger
//
//  Created by Olibo moni on 07/10/2023.
//

import SwiftUI

struct SpeakerArc: Shape {
    var speakerIndex: Int
    var totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
            360.0 / Double(totalSpeakers)
        }
    
    private var startAngle: Angle {
            Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0)
        }
    
    private var middleAngle: Angle {
        var temp =  degreesPerSpeaker * Double(speakerIndex)
        temp += 1.0
        
        return Angle(degrees: temp)
    }
    
    private var endAngle: Angle {
          // return Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0)
        //MARK: Try out formula
        Angle(degrees: Double(speakerIndex + 1) * degreesPerSpeaker)
        }
    
    func path(in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint(x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
            
        }
    }
}

