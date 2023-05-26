//
//  SnowballSwitch.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct SnowballSwitch: View {
    @Binding var isOn: Bool
    var title: String?
    var subtitle: String?

    public init(isOn: Binding<Bool>,
                title: String? = nil,
                subtitle: String? = nil) {
        self._isOn = isOn
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        Toggle(isOn: $isOn) {
            if let title = title {
                SnowballTitleLabel(title: title, subtitle: subtitle)
            }
        }
        .toggleStyle(.switch)
    }
}

struct SnowballSwitch_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SnowballSwitch(isOn: .constant(true))

            SnowballSwitch(isOn: .constant(false))

            SnowballSwitch(isOn: .constant(true), title: "Label")

            SnowballSwitch(isOn: .constant(true), title: "Label", subtitle: "Add some description for the switch here.")
        }
        .padding(.horizontal)
    }
}
