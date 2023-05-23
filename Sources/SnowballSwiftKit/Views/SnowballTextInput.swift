//
//  SnowballTextInput.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct SnowballTextInput: View {
    var leftIcon: String?
    var leftSystemIcon: String?
    @Binding var text: String
    var rightIcon: String?
    var rightSystemIcon: String?
    var emptyStateText: String

    public init(leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                text: Binding<String>,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                emptyStateText: String = "Text") {
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self._text = text
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.emptyStateText = emptyStateText
    }

    public var body: some View {
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

struct SnowballTextInput_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SnowballTextInput(text: .constant("hello world"))
                .padding()

            SnowballTextInput(leftSystemIcon: "clipboard", text: .constant("hello world"))
                .padding()

            SnowballTextInput(text: .constant(""))
                .padding()
        }
    }
}
