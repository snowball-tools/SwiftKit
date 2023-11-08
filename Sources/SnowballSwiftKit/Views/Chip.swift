//
//  Chip.swift
//
//
//  Created by Vivian Phung on 6/30/23.
//

import SwiftUI
import SnowballAssetKit

public enum ChipSize {
    case small
    case medium
}

public struct Chip<LeadingContent: View, TrailingContent: View, TitleString: StringProtocol>: View {

    @Environment(\.isEnabled)
    private var isEnabled
    
    @Binding
    private var isActive: Bool

    private var title: TitleString
    private var leadingContent: () -> LeadingContent
    private var trailingContent: () -> TrailingContent
    private var size: ChipSize

    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                size: ChipSize = .small,
                leadingContent: @escaping () -> LeadingContent,
                trailingContent: @escaping () -> TrailingContent) {
        self._isActive = isActive
        self.title = title
        self.leadingContent = leadingContent
        self.trailingContent = trailingContent
        self.size = size
    }

    public var body: some View {
        Button {
            isActive.toggle()
        } label: {
            HStack(spacing: 4) {
                leadingContent()
                Text(title)
                    .font(Font.system(size: 12))
                    .lineSpacing(16)
               trailingContent()
            }
            .foregroundColor(foregroundColor)
            .padding(padding)
            .background(backgroundColor)
            .cornerRadius(100)
        }
        .disabled(!isEnabled)
    }

    var backgroundColor: Color {
        if !isEnabled {
            return Color(.systemFill)
        }
        return isActive ? SnowballColor.secondaryButton.color : Color(.tertiarySystemFill)
    }

    var foregroundColor: Color {
        if !isEnabled {
            return Color(.tertiaryLabel)
        }
        return isActive ? Color(.systemBlue) : Color(.label)
    }

    var padding: EdgeInsets {
        switch size {
        case .small:
            return EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)
        case .medium:
            return EdgeInsets(top: 8, leading: 12, bottom: 8, trailing: 12)
        }
    }
}

extension Chip where LeadingContent == EmptyView, TrailingContent == EmptyView {
    public init(isActive: Binding<Bool> = .constant(true), 
                title: TitleString,
                size: ChipSize = .small) {
        self.init(isActive: isActive, 
                  title: title,
                  size: size,
                  leadingContent: EmptyView.init,
                  trailingContent: EmptyView.init)
    }
}

extension Chip where TrailingContent == EmptyView {
    public init(isActive: Binding<Bool> = .constant(true), 
                title: TitleString,
                size: ChipSize = .small,
                leadingContent: @escaping () -> LeadingContent) {
        self.init(isActive: isActive, 
                  title: title,
                  size: size,
                  leadingContent: leadingContent,
                  trailingContent: EmptyView.init)
    }
}

extension Chip where LeadingContent == EmptyView {
    public init(isActive: Binding<Bool> = .constant(true), 
                title: TitleString,
                size: ChipSize = .small,
                trailingContent: @escaping () -> TrailingContent) {
        self.init(isActive: isActive, 
                  title: title,
                  size: size,
                  leadingContent: EmptyView.init,
                  trailingContent: trailingContent)
    }
}

struct Chip_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Chip(isActive: .constant(true), title: "Chip")
            Chip(isActive: .constant(false), title: "Chip", size: .medium)
            Chip(isActive: .constant(false), title: "Chip", size: .medium)
            Chip(title: "Chip", size: .medium)
                .disabled(true)
        }
    }
}
