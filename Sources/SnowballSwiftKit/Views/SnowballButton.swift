//
//  SnowballButton.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballButton: View {
    var text: String?
    var leftIcon: String?
    var leftSystemIcon: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var action: () -> Void
    var spacing: CGFloat

    public init(_ text: String? = nil,
                leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                action: @escaping () -> Void,
                spacing: CGFloat = 4) {
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.text = text
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.action = action
        self.spacing = spacing
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: spacing) {
                if let leftIcon = leftIcon {
                    Image(leftIcon)
                }
                if let leftSystemIcon = leftSystemIcon {
                    Image(systemName: leftSystemIcon)
                }
                if let text = text {
                    Text(text)
                }
                if let rightIcon = rightIcon {
                    Image(rightIcon)
                }
                if let rightSystemIcon = rightSystemIcon {
                    Image(systemName: rightSystemIcon)
                }
            }
        }
    }
}

struct SnowballButton_Previews: PreviewProvider {
    static var previews: some View {
        SnowballButton("hello") {
            print("blah test tap")
        }
        .buttonStyle(.snowballDanger(.large))
    }
}