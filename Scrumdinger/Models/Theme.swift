//
//  Theme.swift
//  Scrumdinger
//
//  Created by Olibo moni on 30/09/2023.
//

import SwiftUI

enum Theme: String {
    case bubblegum
    case buttercup
    case indigoCustom
    case lavender
    case magentaCustom
    case navy
    case orangeCustom
    case oxblood
    case periwinkle
    case poppy
    case purpleCustom
    case seafoam
    case sky
    case tan
    case tealCustom
    case yellowCustom
    
    
    var accentColor: Color {
           switch self {
           case .bubblegum, .buttercup, .lavender, .orangeCustom, .periwinkle, .poppy, .seafoam, .sky, .tan, .tealCustom, .yellowCustom: return .black
           case .indigoCustom, .magentaCustom, .navy, .oxblood, .purpleCustom: return .white
           }
       }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        rawValue.capitalized
    }
}
