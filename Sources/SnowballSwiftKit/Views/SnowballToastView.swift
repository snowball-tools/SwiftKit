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
    var title: String
    var subtitle: String?

    public init(type: SnowballToastType,
                title: String,
                subtitle: String? = nil) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Image(systemName: type.systemName)
                .font(.subheadline)
                .foregroundColor(type.backgroundColor)
                .frame(height: 24)

            SnowballTitleLabel(title: title, subtitle: subtitle, spacing: 4, font: .subheadline)
                .alignmentGuide(.firstTextBaseline) { d in d[.firstTextBaseline] + 2 }
        }
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .padding(.all, 12)
        .background(Color(uiColor: UIColor.systemBackground))
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color(uiColor: .separator), lineWidth: 1))
        .cornerRadius(12)
        .shadow(color: Color.primary.opacity(0.06), radius: 10, x: 0, y: 3)
        .shadow(color: Color.primary.opacity(0.04), radius: 3, x: 0, y: 1)
    }
}
