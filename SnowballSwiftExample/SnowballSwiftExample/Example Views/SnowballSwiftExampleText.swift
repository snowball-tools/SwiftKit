//
//  SnowballSwiftExampleText.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/22/23.
//

import SwiftUI

struct SnowballSwiftExampleText: View {
    var body: some View {
        List(Array(Font.TextStyle.allCases.keys), id: \.self) { key in
            Text(key)
                .font(.system(Font.TextStyle.allCases[key]!))
        }
        .listStyle(.plain)
    }
}

struct SnowballSwiftExampleText_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleText()
    }
}

extension Font.TextStyle {
    static let allCases: [String: Font.TextStyle] = [
        "Large Title": .largeTitle,
        "Title": .title,
        "Headline": .headline,
        "Subheadline": .subheadline,
        "Body": .body,
        "Callout": .callout,
        "Footnote": .footnote,
        "Caption": .caption
    ]
}

