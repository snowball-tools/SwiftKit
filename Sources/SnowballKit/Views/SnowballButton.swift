//
//  SnowballButton.swift
//  SnowballKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct SnowballButton: View {
    var leftIcon: String?
    var text: String?
    var rightIcon: String?
    var action: () -> Void
    var isEnabled: Bool
    
    public init(leftIcon: String? = nil, text: String? = nil, rightIcon: String? = nil, action: @escaping () -> Void, isEnabled: Bool) {
        self.leftIcon = leftIcon
        self.text = text
        self.rightIcon = rightIcon
        self.action = action
        self.isEnabled = isEnabled
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
        .buttonStyle(TintedButtonStyle(color: .green))
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.3)
    }
}

struct FilledButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(color)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

struct TintedButtonStyle: ButtonStyle {
    let color: Color
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(color)
    }
}

struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.primary)
    }
}

struct DangerButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

extension ButtonStyle where Self == DangerButtonStyle {
    static func danger() -> DangerButtonStyle {
        DangerButtonStyle()
    }
}
