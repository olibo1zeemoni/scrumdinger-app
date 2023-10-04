//
//  ScrumProgressViewStyle.swift
//  Scrumdinger
//
//  Created by Olibo moni on 04/10/2023.
//

import SwiftUI

struct ScrumProgressViewStyle: ProgressViewStyle {
    var theme: Theme
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .fill(theme.accentColor)
                .frame(height: 20.0)
            
            ProgressView(configuration)
                .tint(theme.mainColor)
                .frame(height: 12.0)
                .padding(.horizontal)
        }
    }
}

#Preview {
     ProgressView(value: 0.4)
    .progressViewStyle(ScrumProgressViewStyle(theme: .buttercup))
    .previewLayout(.sizeThatFits)
}
