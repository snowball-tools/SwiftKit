//
//  LabeledButton.swift
//  SwiftKit
//
//  Created by Vivian Phung on 5/1/23.
//

import SwiftUI

/// A customizable button with optional leading and trailing labels.
///
/// This button allows for flexible configuration with text and/or images.
///
/// - Parameters:
///   - S: The type of the button's text, which must conform to `StringProtocol`.
///   - LeadingLabel: The type of view to be displayed before the text.
///   - TrailingLabel: The type of view to be displayed after the text.
public struct LabeledButton<S: StringProtocol, LeadingLabel: View, TrailingLabel: View>: View {
    private var text: S?
    private var leadingLabel: () -> LeadingLabel
    private var trailingLabel: () -> TrailingLabel
    private var spacing: CGFloat
    private var action: () -> Void

    /// Creates a new labeled button with the specified configuration.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - action: The action to perform when the button is tapped.
    ///   - spacing: The spacing between the button's components.
    ///   - leadingLabel: A closure returning the view to display before the text.
    ///   - trailingLabel: A closure returning the view to display after the text.
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

/// Extension providing convenience initializers for buttons with images.
extension LabeledButton where LeadingLabel == Image, TrailingLabel == Image {
    /// Creates a new labeled button with leading and trailing images.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - leadingImageName: The name of the image to display before the text.
    ///   - trailingImageName: The name of the image to display after the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, leadingImageName: String, trailingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            Image(leadingImageName)
        } trailingLabel: {
            Image(trailingImageName)
        }
    }
    
    /// Creates a new labeled button with leading and trailing system images.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - leadingImageSystemName: The name of the system image to display before the text.
    ///   - trailingImageSystemName: The name of the system image to display after the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, leadingImageSystemName: String, trailingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            Image(systemName: leadingImageSystemName)
        } trailingLabel: {
            Image(systemName: trailingImageSystemName)
        }
    }
}

/// Extension providing convenience initializers for buttons with a leading image.
extension LabeledButton where LeadingLabel == Image, TrailingLabel == EmptyView {
    /// Creates a new labeled button with a leading image.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - leadingImageName: The name of the image to display before the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, leadingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            Image(leadingImageName)
        } trailingLabel: {
            EmptyView()
        }
    }
    
    /// Creates a new labeled button with a leading system image.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - leadingImageSystemName: The name of the system image to display before the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, leadingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            Image(systemName: leadingImageSystemName)
        } trailingLabel: {
            EmptyView()
        }
    }
}

/// Extension providing convenience initializers for buttons with a trailing image.
extension LabeledButton where LeadingLabel == EmptyView, TrailingLabel == Image {
    /// Creates a new labeled button with a trailing image.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - trailingImageName: The name of the image to display after the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, trailingImageName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            EmptyView()
        } trailingLabel: {
            Image(trailingImageName)
        }
    }
    
    /// Creates a new labeled button with a trailing system image.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - trailingImageSystemName: The name of the system image to display after the text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, trailingImageSystemName: String, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing) {
            EmptyView()
        } trailingLabel: {
            Image(systemName: trailingImageSystemName)
        }
    }
}

/// Extension providing a convenience initializer for buttons with only text.
extension LabeledButton where LeadingLabel == EmptyView, TrailingLabel == EmptyView {
    /// Creates a new labeled button with only text.
    ///
    /// - Parameters:
    ///   - text: The text to display on the button. Pass `nil` for no text.
    ///   - spacing: The spacing between the button's components.
    ///   - action: The action to perform when the button is tapped.
    public init(text: S? = nil, spacing: CGFloat = 4, action: @escaping () -> Void) {
        self.init(text, action: action, spacing: spacing, leadingLabel: EmptyView.init, trailingLabel: EmptyView.init)
    }
}

struct LabeledButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20) {
            // Basic button with text only
            LabeledButton(text: "Basic Button") {
                print("Basic button tapped")
            }
            
            // Button with leading image
            LabeledButton(text: "Leading Image", leadingImageSystemName: "star.fill") {
                print("Leading image button tapped")
            }
            
            // Button with trailing image
            LabeledButton(text: "Trailing Image", trailingImageSystemName: "arrow.right") {
                print("Trailing image button tapped")
            }
            
            // Button with both leading and trailing images
            LabeledButton(text: "Both Images",
                          leadingImageSystemName: "person.fill",
                          trailingImageSystemName: "checkmark") {
                print("Both images button tapped")
            }
            
            // Button with custom spacing
            LabeledButton("Custom Spacing", action: {
                print("Custom spacing button tapped")
            }, spacing: 12) {
                Image(systemName: "gear")
            } trailingLabel: {
                Image(systemName: "arrow.right.circle")
            }
            
            // Button with no text, just images
            LabeledButton<String, Image, Image>(
                text: nil,
                leadingImageSystemName: "heart.fill",
                trailingImageSystemName: "star.fill"
            ) {
                print("No text button tapped")
            }
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
