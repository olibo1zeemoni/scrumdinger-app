//
//  ThemeView.swift
//  Scrumdinger
//
//  Created by Olibo moni on 02/10/2023.
//

import SwiftUI

struct ThemeView: View {
    let theme: Theme
    
    var body: some View {
        Text(theme.name)
            .padding(4)
            .frame(maxWidth: .infinity)
            .background(theme.mainColor)
            .foregroundStyle(theme.accentColor)
            .clipShape(RoundedRectangle(cornerSize: CGSize(width: 2, height: 1)))
    }
}

#Preview {
    ThemeView(theme: .bubblegum)
}
