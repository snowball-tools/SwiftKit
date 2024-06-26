//
//  ClosableChip.swift
//  SwiftKit
//
//  Created by Vivian Phung on 6/26/24.
//

import SwiftUI

/// A chip component that includes a close button.
///
/// The `ClosableChip` struct extends the functionality of `Chip` by adding a close button,
/// allowing for easy removal or dismissal of the chip.
///
/// Example usage:
/// ```
/// ClosableChip(isActive: $isActive, title: "Remove me", onClose: handleClose) {
///     Image(systemName: "tag")
/// }
/// ```
public struct ClosableChip<LeadingContent: View, TitleString: StringProtocol>: View {
    @Binding private var isActive: Bool
    private let title: TitleString
    private let size: ChipSize
    private let onClose: () -> Void
    private let leadingContent: () -> LeadingContent

    /// Creates a new closable chip with the specified configuration.
    ///
    /// - Parameters:
    ///   - isActive: A binding to a Boolean value that determines whether the chip is in an active state.
    ///   - title: The text to display as the chip's title.
    ///   - size: The size of the chip. Defaults to `.small`.
    ///   - onClose: A closure to execute when the close button is tapped.
    ///   - leadingContent: A closure that returns the view to display before the title.
    ///
    /// - Returns: A new closable chip view with the specified configuration.
    public init(isActive: Binding<Bool>,
                title: TitleString,
                size: ChipSize = .small,
                onClose: @escaping () -> Void,
                @ViewBuilder leadingContent: @escaping () -> LeadingContent) {
        self._isActive = isActive
        self.title = title
        self.size = size
        self.onClose = onClose
        self.leadingContent = leadingContent
    }

    public var body: some View {
        Chip(isActive: $isActive, title: title, size: size) {
            leadingContent()
        } trailingContent: {
            Button(action: onClose) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.secondary)
            }
            .buttonStyle(PlainButtonStyle())
        }
    }
}

struct ClosableChip_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Group {
                    PreviewSection(title: "Basic ClosableChip") {
                        BasicClosableChipExample()
                    }
                    
                    PreviewSection(title: "ClosableChip with Icon") {
                        IconClosableChipExample()
                    }
                    
                    PreviewSection(title: "ClosableChip Sizes") {
                        SizeClosableChipExample()
                    }
                }
                
                Group {
                    PreviewSection(title: "Custom Styled ClosableChip") {
                        CustomStyledClosableChipExample()
                    }
                    
                    PreviewSection(title: "Interactive ClosableChip") {
                        InteractiveClosableChipExample()
                    }
                }
                
                PreviewSection(title: "Dark Mode ClosableChip") {
                    DarkModeClosableChipExample()
                }
                .environment(\.colorScheme, .dark)
            }
            .padding()
        }
    }
}

struct BasicClosableChipExample: View {
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            ClosableChip(isActive: .constant(true), title: "Basic Chip", onClose: {
                isVisible = false
            }) {
                EmptyView()
            }
        }
    }
}

struct IconClosableChipExample: View {
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            ClosableChip(isActive: .constant(true), title: "With Icon", onClose: {
                isVisible = false
            }) {
                Image(systemName: "star.fill")
            }
        }
    }
}

struct SizeClosableChipExample: View {
    @State private var isVisibleSmall = true
    @State private var isVisibleMedium = true
    
    var body: some View {
        VStack {
            if isVisibleSmall {
                ClosableChip(isActive: .constant(true), title: "Small", size: .small, onClose: {
                    isVisibleSmall = false
                }) {
                    EmptyView()
                }
            }
            if isVisibleMedium {
                ClosableChip(isActive: .constant(true), title: "Medium", size: .medium, onClose: {
                    isVisibleMedium = false
                }) {
                    EmptyView()
                }
            }
        }
    }
}

struct CustomStyledClosableChipExample: View {
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            ClosableChip(isActive: .constant(true), title: "Custom Style", onClose: {
                isVisible = false
            }) {
                Circle()
                    .fill(Color.red)
                    .frame(width: 10, height: 10)
            }
            .background(Color.yellow.opacity(0.3))
            .clipShape(RoundedRectangle(cornerRadius: 8))
        }
    }
}

struct InteractiveClosableChipExample: View {
    @State private var isVisible = true
    @State private var isActive = false
    
    var body: some View {
        if isVisible {
            ClosableChip(isActive: $isActive, title: isActive ? "Active" : "Inactive", onClose: {
                isVisible = false
            }) {
                Image(systemName: isActive ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct DarkModeClosableChipExample: View {
    @State private var isVisible = true
    
    var body: some View {
        if isVisible {
            ClosableChip(isActive: .constant(true), title: "Dark Mode", onClose: {
                isVisible = false
            }) {
                Image(systemName: "moon.fill")
            }
        }
    }
}
