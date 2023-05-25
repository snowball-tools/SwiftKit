//
//  SnowballButtonStyles.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/24/23.
//

import SwiftUI
import SnowballAssetKit

public enum SnowballButtonSize {
    case small, large

    var edgeInsets: EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        case .large:
            return EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16)
        }
    }
}

// MARK: FilledButtonStyle
public struct SnowballButtonStyle: ButtonStyle {
    let color: Color
    let foregroundColor: Color
    let buttonSize: SnowballButtonSize

    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(buttonSize.edgeInsets)
            .background(color)
            .foregroundColor(foregroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

public extension ButtonStyle where Self == SnowballButtonStyle {
    static var snowballTinted: Self { .init(color: SnowballColor.tintedButton, foregroundColor: SnowballColor.tintedButtonForeground, buttonSize: .small) }

    static var snowballFilled: Self { .init(color: SnowballColor.filledButton, foregroundColor: SnowballColor.filledButtonForeground, buttonSize: .small) }
    static var snowballDanger: Self { .init(color: SnowballColor.dangerButton, foregroundColor: SnowballColor.dangerButtonForeground, buttonSize: .small) }

    static func snowballFilled(color: Color, buttonSize: SnowballButtonSize) -> Self { .init(color: color, foregroundColor: SnowballColor.filledButtonForeground, buttonSize: buttonSize) }
    static func snowballFilled(color: Color) -> Self { .init(color: color, foregroundColor: SnowballColor.filledButtonForeground, buttonSize: .small) }
    static func snowballFilled(buttonSize: SnowballButtonSize) -> Self { .init(color: SnowballColor.filledButton, foregroundColor: SnowballColor.filledButtonForeground, buttonSize: .small) }

    static func snowballDanger(_ buttonSize: SnowballButtonSize) -> Self { .init(color: SnowballColor.dangerButton, foregroundColor: SnowballColor.dangerButtonForeground, buttonSize: .small) }
}
