//
//  SnowballSwitchLabel.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct SnowballSwitchLabel: View {
    @Binding var isOn: Bool
    var text: String?
    var subheadline: String?

    public init(isOn: Binding<Bool>, text: String? = nil, subheadline: String? = nil) {
        self._isOn = isOn
        self.text = text
        self.subheadline = subheadline
    }

    public var body: some View {
        Toggle(isOn: $isOn) {
            VStack(alignment: .leading, spacing: 5) {
                if let text = text {
                    Text(text)
                        .font(.body)
                }

                if let subheadline = subheadline {
                    Text(subheadline)
                        .font(.footnote)
                        .foregroundColor(Color.secondary)
                }
            }
        }
        .toggleStyle(.switch)
    }
}

struct SnowballSwitchLabel_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwitchLabel(isOn: .constant(true), text: "Label", subheadline: "Provide additional context or helpful information.")
        .padding()
    }
}
