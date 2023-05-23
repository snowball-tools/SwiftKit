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
            SnowballToastView(type: .error, text: SnowballToastType.error.rawValue)

            SnowballToastView(type: .neutral, text: SnowballToastType.neutral.rawValue)

            SnowballToastView(type: .positive, text: SnowballToastType.positive.rawValue)

            SnowballToastView(type: .warning, text: SnowballToastType.warning.rawValue)

            SnowballToastView(type: .error, text: SnowballToastType.error.rawValue, subTitle: "Add some description for the toast here.")

            SnowballToastView(type: .neutral, text: SnowballToastType.neutral.rawValue, subTitle: "Add some description for the toast here.")

            SnowballToastView(type: .positive, text: SnowballToastType.positive.rawValue, subTitle: "Add some description for the toast here.")

            SnowballToastView(type: .warning, text: SnowballToastType.warning.rawValue, subTitle: "Add some description for the toast here.")
        }
    }
}

struct SnowballSwiftExampleToastView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleToastView()
            .padding()
    }
}
