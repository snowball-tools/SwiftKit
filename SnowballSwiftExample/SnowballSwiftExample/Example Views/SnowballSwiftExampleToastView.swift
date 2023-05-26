//
//  SnowballSwiftExampleToastView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/23/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleToastView: View {
    var body: some View {
        VStack(spacing: 10) {
            SnowballToastView(type: .error, title: SnowballToastType.error.rawValue)

            SnowballToastView(type: .neutral, title: SnowballToastType.neutral.rawValue)

            SnowballToastView(type: .positive, title: SnowballToastType.positive.rawValue)

            SnowballToastView(type: .warning, title: SnowballToastType.warning.rawValue)

            SnowballToastView(type: .error, title: SnowballToastType.error.rawValue, subtitle: "Add some description for the toast here.")

            SnowballToastView(type: .neutral, title: SnowballToastType.neutral.rawValue, subtitle: "Add some description for the toast here.")

            SnowballToastView(type: .positive, title: SnowballToastType.positive.rawValue, subtitle: "Add some description for the toast here.")

            SnowballToastView(type: .warning, title: SnowballToastType.warning.rawValue, subtitle: "Add some description for the toast here.")
        }
    }
}

struct SnowballSwiftExampleToastView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleToastView()
            .padding()
    }
}
