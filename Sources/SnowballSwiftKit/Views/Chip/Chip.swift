//
//  Chip.swift
//  SwiftKit
//
//  Created by Vivian Phung on 6/30/23.
//

import SwiftUI
import SnowballAssetKit

public enum ChipSize {
    case small
    case medium
}

/// A customizable chip component that can display a title with optional leading and trailing content.
///
/// The `Chip` struct provides a flexible way to create chip-style UI elements with various configurations.
/// It supports different sizes, custom content, and active/inactive states.
///
/// Example usage:
/// ```
/// Chip(isActive: $isSelected, title: "Swift", leadingSystemName: "swift")
/// ```
public struct Chip<LeadingContent: View, TrailingContent: View, TitleString: StringProtocol>: View {
    
    @Environment(\.isEnabled)
    private var isEnabled
    
    @Binding
    private var isActive: Bool
    
    private var title: TitleString
    private var leadingContent: () -> LeadingContent
    private var trailingContent: () -> TrailingContent
    private var size: ChipSize
    private let cornerRadius: CGFloat
    private let font: Font
    
    /// Creates a new chip with the specified configuration.
    ///
    /// - Parameters:
    ///   - isActive: A binding to a Boolean value that determines whether the chip is in an active state.
    ///   - title: The text to display as the chip's title.
    ///   - size: The size of the chip. Defaults to `.small`.
    ///   - leadingContent: A closure that returns the view to display before the title.
    ///   - trailingContent: A closure that returns the view to display after the title.
    ///
    /// - Returns: A new chip view with the specified configuration.
    public init(isActive: Binding<Bool> = .constant(true),                title: TitleString,
                size: ChipSize = .small,
                cornerRadius: CGFloat = 16,
                font: Font = .system(size: 12),
                @ViewBuilder leadingContent: @escaping () -> LeadingContent,
                @ViewBuilder trailingContent: @escaping () -> TrailingContent) {
        self._isActive = isActive
        self.title = title
        self.leadingContent = leadingContent
        self.trailingContent = trailingContent
        self.size = size
        self.cornerRadius = cornerRadius
        self.font = font
    }
    
    public var body: some View {
        Button {
            withAnimation(.easeInOut(duration: 0.2)) {
                isActive.toggle()
            }
            UIImpactFeedbackGenerator(style: .light).impactOccurred()
        } label: {
            HStack(spacing: 4) {
                leadingContent()
                Text(title)
                    .font(font)
                    .lineSpacing(16)
                trailingContent()
            }
            .foregroundColor(foregroundColor)
            .padding(padding)
            .background(backgroundColor)
            .clipShape(Capsule())
        }
        .disabled(!isEnabled)
        .accessibility(label: Text("\(title) chip"))
        .accessibility(hint: Text("Tap to toggle selection"))
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

extension Chip where LeadingContent == Image, TrailingContent == Image {
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingImageName: String,
                trailingImageName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(leadingImageName)
        } trailingContent: {
            Image(trailingImageName)
        }
    }
    
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingSystemName: String,
                trailingSystemName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(systemName: leadingSystemName)
        } trailingContent: {
            Image(systemName: trailingSystemName)
        }
    }
}

extension Chip where LeadingContent == Image {
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingImageName: String,
                size: ChipSize = .small,
                trailingContent: @escaping () -> TrailingContent) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(leadingImageName)
        } trailingContent: {
            trailingContent()
        }
    }
    
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingSystemName: String,
                size: ChipSize = .small,
                trailingContent: @escaping () -> TrailingContent) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(systemName: leadingSystemName)
        } trailingContent: {
            trailingContent()
        }
    }
}

extension Chip where TrailingContent == Image {
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                trailingImageName: String,
                size: ChipSize = .small,
                leadingContent: @escaping () -> LeadingContent) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            leadingContent()
        } trailingContent: {
            Image(trailingImageName)
        }
    }
    
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                trailingSystemName: String,
                size: ChipSize = .small,
                leadingContent: @escaping () -> LeadingContent) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            leadingContent()
        } trailingContent: {
            Image(systemName: trailingSystemName)
        }
    }
}

extension Chip where LeadingContent == EmptyView, TrailingContent == Image {
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                trailingImageName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            EmptyView()
        } trailingContent: {
            Image(trailingImageName)
        }
    }
    
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                trailingSystemName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            EmptyView()
        } trailingContent: {
            Image(systemName: trailingSystemName)
        }
    }
}

extension Chip where LeadingContent == Image, TrailingContent == EmptyView {
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingImageName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(leadingImageName)
        } trailingContent: {
            EmptyView()
        }
    }
    
    public init(isActive: Binding<Bool> = .constant(true),
                title: TitleString,
                leadingSystemName: String,
                size: ChipSize = .small) {
        self.init(isActive: isActive,
                  title: title,
                  size: size) {
            Image(systemName: leadingSystemName)
        } trailingContent: {
            EmptyView()
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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    PreviewSection(title: "Basic Chips") {
                        Chip(title: "Default")
                        Chip(isActive: .constant(true), title: "Active")
                        Chip(isActive: .constant(false), title: "Inactive")
                        Chip(title: "Disabled").disabled(true)
                    }
                    
                    PreviewSection(title: "Chip Sizes") {
                        Chip(title: "Small", size: .small)
                        Chip(title: "Medium", size: .medium)
                    }
                    
                    PreviewSection(title: "Custom Appearance") {
                        Chip(title: "Custom Corner", cornerRadius: 8, leadingContent: { EmptyView() }, trailingContent: { EmptyView() })
                        Chip(title: "Custom Font", font: .system(size: 14, weight: .bold), leadingContent: { EmptyView() }, trailingContent: { EmptyView() })
                    }
                    
                    PreviewSection(title: "Chips with Icons") {
                        Chip(title: "Left Icon", leadingSystemName: "star.fill")
                        Chip(title: "Right Icon", trailingSystemName: "arrow.right")
                        Chip(title: "Both", leadingSystemName: "person.fill", trailingSystemName: "checkmark")
                    }
                }
                
                Group {
                    PreviewSection(title: "Custom Content") {
                        Chip(title: "Custom Leading") {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                        } trailingContent: {
                            EmptyView()
                        }
                        
                        Chip(title: "Custom Trailing", leadingContent: { EmptyView() }) {
                            Text("!")
                                .font(.system(size: 14, weight: .bold))
                                .foregroundColor(.red)
                        }
                    }
                    
                    PreviewSection(title: "Interactive Chip") {
                        InteractiveChipExample()
                    }
                }
                
                PreviewSection(title: "Dark Mode") {
                    Chip(title: "Dark Mode")
                    Chip(isActive: .constant(true), title: "Active")
                    Chip(title: "With Icon", leadingSystemName: "moon.fill")
                }
                .environment(\.colorScheme, .dark)
            }
            .padding()
        }
    }
}

struct PreviewSection<Content: View>: View {
    let title: String
    let content: Content
    
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title).font(.headline)
            HStack(spacing: 10) {
                content
            }
        }
    }
}

struct InteractiveChipExample: View {
    @State private var isActive = false
    
    var body: some View {
        Chip(isActive: $isActive, title: isActive ? "Active" : "Inactive", leadingSystemName: isActive ? "checkmark.circle.fill" : "circle")
    }
}
