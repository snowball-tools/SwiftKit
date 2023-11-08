//
//  SnowballButton.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

public struct LabeledButton<S: StringProtocol, LeadingLabel: View, TrailingLabel: View>: View {
    private var text: S?
    private var leadingLabel: () -> LeadingLabel
    private var trailingLabel: () -> TrailingLabel
    private var spacing: CGFloat = 0
    private var action: () -> Void

    public init(_ text: S? = nil,
                action: @escaping () -> Void,
                spacing: CGFloat = 4,
                leadingLabel: @escaping () -> LeadingLabel,
                trailingLabel: @escaping () -> TrailingLabel) {
        self.text = text
        self.action = action
        self.spacing = spacing
        self.leadingLabel = leadingLabel
        self.trailingLabel = trailingLabel
    }

    public var body: some View {
        Button(action: action) {
            HStack(spacing: spacing) {
                leadingLabel()
                if let text {
                    Text(text)
                }
                trailingLabel()
            }
        }
    }
}

extension LabeledButton where LeadingLabel == Image, TrailingLabel == Image {
    public init(text: S? = nil, leadingImageName: String, trailingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            Image(leadingImageName)
        } trailingLabel: {
            Image(trailingImageName)
        }
    }
    
    public init(text: S? = nil, leadingImageSystemName: String, trailingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            Image(systemName: leadingImageSystemName)
        } trailingLabel: {
            Image(systemName: trailingImageSystemName)
        }
    }
}

extension LabeledButton where LeadingLabel == Image, TrailingLabel == EmptyView {
    public init(text: S? = nil, leadingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            Image(leadingImageName)
        } trailingLabel: {
            EmptyView()
        }
    }
    
    public init(text: S? = nil, leadingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            Image(systemName: leadingImageSystemName)
        } trailingLabel: {
            EmptyView()
        }
    }
}

extension LabeledButton where LeadingLabel == EmptyView, TrailingLabel == Image {
    public init(text: S? = nil, trailingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            EmptyView()
        } trailingLabel: {
            Image(trailingImageName)
        }
    }
    
    public init(text: S? = nil, trailingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action) {
            EmptyView()
        } trailingLabel: {
            Image(systemName: trailingImageSystemName)
        }
    }
}

extension LabeledButton where LeadingLabel == EmptyView, TrailingLabel == EmptyView {
    public init(text: S? = nil, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, leadingLabel: EmptyView.init, trailingLabel: EmptyView.init)
    }
}
