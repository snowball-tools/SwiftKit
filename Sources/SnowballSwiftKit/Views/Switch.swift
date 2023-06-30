//
//  Switch.swift
//  SnowballSwiftKit
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI

public struct Switch: View {
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
                TitleLabel(title: title, subtitle: subtitle)
            }
        }
        .toggleStyle(.switch)
    }
}

struct Switch_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Switch(isOn: .constant(true))

            Switch(isOn: .constant(false))

            Switch(isOn: .constant(true), title: "Label")

            Switch(isOn: .constant(true), title: "Label", subtitle: "Add some description for the switch here.")
        }
        .padding(.horizontal)
    }
}
