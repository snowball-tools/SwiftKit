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
    var subTitle: String?

    public init(type: SnowballToastType, text: String, subTitle: String? = nil) {
        self.type = type
        self.text = text
        self.subTitle = subTitle
    }

    public var body: some View {
        HStack {
            HStack(alignment: (subTitle != nil) ? .top : .center, spacing: 8) {
                Image(systemName: type.systemName)
                    .font(.subheadline)
                    .foregroundColor(type.backgroundColor)
                    .offset(y: (subTitle != nil) ? 2 : 0)
                VStack(alignment: .leading, spacing: 4) {
                    Text(text)
                        .font(.footnote)
                        .bold()
                    if let subTitle = subTitle {
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

struct SnowballToastView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballToastView(type: .error, text: SnowballToastType.error.rawValue)
                .padding()

            SnowballToastView(type: .neutral, text: SnowballToastType.neutral.rawValue)
                .padding()

            SnowballToastView(type: .positive, text: SnowballToastType.positive.rawValue)
                .padding()

            SnowballToastView(type: .warning, text: SnowballToastType.warning.rawValue)
                .padding()

            SnowballToastView(type: .error, text: SnowballToastType.error.rawValue, subTitle: "Add some description for the toast here.")
                .padding()

            SnowballToastView(type: .neutral, text: SnowballToastType.neutral.rawValue, subTitle: "Add some description for the toast here.")
                .padding()

            SnowballToastView(type: .positive, text: SnowballToastType.positive.rawValue, subTitle: "Add some description for the toast here.")
                .padding()

            SnowballToastView(type: .warning, text: SnowballToastType.warning.rawValue, subTitle: "Add some description for the toast here.")
                .padding()
        }
    }
}
