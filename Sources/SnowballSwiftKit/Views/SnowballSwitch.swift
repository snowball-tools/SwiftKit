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
