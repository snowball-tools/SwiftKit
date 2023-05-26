//
//  SnowballToastView.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public enum SnowballToastType: String {
    case error, warning, neutral, positive

    var systemName: String {
        switch self {
        case .error:
            return "exclamationmark.circle.fill"
        case .warning:
            return "exclamationmark.triangle.fill"
        case .neutral:
            return "info.circle.fill"
        case .positive:
            return "checkmark.circle.fill"
        }
    }

    var backgroundColor: Color {
        switch self {
        case .error:
            return .red
        case .warning:
            return .orange
        case .neutral:
            return .accentColor
        case .positive:
            return .green
        }
    }
}

public struct SnowballToastView: View {
    var type: SnowballToastType
    var text: String
    var subtitle: String?

    public init(type: SnowballToastType,
                text: String,
                subTitle: String? = nil) {
        self.type = type
        self.text = text
        self.subtitle = subTitle
    }

    public var body: some View {
        HStack {
            HStack(alignment: (subtitle != nil) ? .top : .center, spacing: 8) {
                Image(systemName: type.systemName)
                    .font(.subheadline)
                    .foregroundColor(type.backgroundColor)
                    .offset(y: (subtitle != nil) ? 2 : 0)
                VStack(alignment: .leading, spacing: 4) {
                    Text(text)
                        .font(.footnote)
                        .bold()
                    if let subTitle = subtitle {
                        Text(subTitle)
                            .font(.caption)
                            .foregroundColor(Color.secondary)
                    }
                }
            }
            .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))

            Spacer()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color(UIColor.separator), lineWidth: 1)
                .shadow(color: Color(UIColor.separator), radius: 10, x: 3, y: 1)
        )

    }
}
