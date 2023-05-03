//
//  SButton.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

struct SButton: View {
    let title: String
    let backgroundColor: Color
    let textColor: Color
    let action: () -> Void
    let font: Font? = .body
    
    init(title: String, backgroundColor: Color = Color.blue, textColor: Color = Color.white, action: @escaping () -> Void) {
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(font)
                .foregroundColor(textColor)
                .padding(.horizontal, 40)
                .padding(.vertical, 12)
                .background(backgroundColor)
                .cornerRadius(30)
        }
    }
}


struct SButton_Previews: PreviewProvider {
    static var previews: some View {
        SButton(title: "button",
                       action: {
            print("Button tapped")
        })
        .padding(10)
        .previewLayout(.sizeThatFits)
    }
}
