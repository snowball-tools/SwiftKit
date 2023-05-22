//
//  SnowballButton.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballButton: View {
    var leftIcon: String?
    var text: String?
    var rightIcon: String?
    var action: () -> Void
    
    public init(leftIcon: String? = nil, text: String? = nil, rightIcon: String? = nil, action: @escaping () -> Void) {
        self.leftIcon = leftIcon
        self.text = text
        self.rightIcon = rightIcon
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack {
                if let leftIcon = leftIcon {
                    Image(systemName: leftIcon)
                }
                if let text = text {
                    Text(text)
                }
                if let rightIcon = rightIcon {
                    Image(systemName: rightIcon)
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
