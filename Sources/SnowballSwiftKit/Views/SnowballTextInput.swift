//
//  SnowballTextInput.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct SnowballTextInput: View {
    @Binding var text: String
    var leftIcon: String?
    var leftSystemIcon: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var emptyStateText: String
    var labelText: String?
    var subheadlineText: String?

    public init(_ text: Binding<String>,
                leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                emptyStateText: String = "Text",
                labelText: String? = nil,
                subheadlineText: String? = nil) {
        self._text = text
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.emptyStateText = emptyStateText
        self.labelText = labelText
        self.subheadlineText = subheadlineText
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 4) {
                if let labelText = labelText {
                    Text(labelText)
                        .font(.body)
                }

                if let subHeadlineText = subheadlineText {
                    Text(subHeadlineText)
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                }
            }
            .padding(EdgeInsets( top: 0, leading: 4, bottom: 0, trailing: 0))

            HStack {
                if let leftIcon = leftIcon {
                    Image(leftIcon)
                }
                if let leftSystemIcon = leftSystemIcon {
                    Image(systemName: leftSystemIcon)
                }

                TextField(emptyStateText, text: $text)

                if let rightIcon = rightIcon {
                    Image(rightIcon)
                }
                if let rightSystemIcon = rightSystemIcon {
                    Image(systemName: rightSystemIcon)
                }
            }
            .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(12)
        }
    }
}

struct SnowballTextInput_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SnowballTextInput(.constant("hello world"))
                .padding()

            SnowballTextInput(.constant("hello world"), leftSystemIcon: "clipboard")
                .padding()

            SnowballTextInput(.constant(""))
                .padding()
        }
    }
}
