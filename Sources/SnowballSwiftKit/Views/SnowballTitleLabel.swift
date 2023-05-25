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

    public init(title: String,
                subtitle: String? = nil,
                spacing: CGFloat = 4) {
        self.title = title
        self.subtitle = subtitle
        self.spacing = spacing
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.body)

            if let subtitle = subtitle {
                Text(subtitle)
                    .font(.footnote)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

struct SnowballTitleLabel_Previews: PreviewProvider {
    static var previews: some View {
        SnowballTitleLabel(title: "Label",
                           subtitle: "Provide additional context or helpful information.")
    }
}
