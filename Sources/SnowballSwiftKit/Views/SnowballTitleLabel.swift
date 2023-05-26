//
//  SnowballTitleLabel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/25/23.
//

import SwiftUI

public struct SnowballTitleLabel: View {
    let title: String
    let subtitle: String?
    let spacing: CGFloat
    let font: Font

    public init(title: String,
                subtitle: String? = nil,
                spacing: CGFloat = 4,
                font: Font = .body) {
        self.title = title
        self.subtitle = subtitle
        self.spacing = spacing
        self.font = font
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(font)

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}
