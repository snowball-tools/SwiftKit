//
//  SnowballButton.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballButton: View {
    var leftIcon: String?
    var leftSystemIcon: String?
    var text: String?
    var rightIcon: String?
    var rightSystemIcon: String?
    var action: () -> Void

    public init(leftIcon: String? = nil,
                leftSystemIcon: String? = nil,
                text: String? = nil,
                rightIcon: String? = nil,
                rightSystemIcon: String? = nil,
                action: @escaping () -> Void) {
        self.leftIcon = leftIcon
        self.leftSystemIcon = leftSystemIcon
        self.text = text
        self.rightIcon = rightIcon
        self.rightSystemIcon = rightSystemIcon
        self.action = action
    }

    public var body: some View {
        Button(action: action) {
            HStack {
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

public struct FilledButtonStyle: ButtonStyle {
    let color: Color

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

public extension ButtonStyle where Self == FilledButtonStyle {
    static func filled(color: Color) -> Self { .init(color: color) }
}

public struct TintedButtonStyle: ButtonStyle {
    let color: Color

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(color)
    }
}

public extension ButtonStyle where Self == TintedButtonStyle {
    static func tinted(color: Color) -> Self { .init(color: color) }
}

public struct PlainButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary)
    }
}

public extension ButtonStyle where Self == PlainButtonStyle {
    static var simple: Self { .init() }
}

public struct DangerButtonStyle: ButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

public extension ButtonStyle where Self == DangerButtonStyle {
    static var danger: Self { .init() }
}
