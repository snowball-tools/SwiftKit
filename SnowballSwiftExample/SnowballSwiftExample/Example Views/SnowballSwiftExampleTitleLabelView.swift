//
//  SnowballSwiftExampleTitleLabelView.swift
//  SnowballSwiftExample
//
//  Created by Vivian Phung on 5/25/23.
//

import SwiftUI
import SnowballSwiftKit

struct SnowballSwiftExampleTitleLabelView: View {
    var body: some View {
        SnowballTitleLabel(title: "Label", subtitle: "Provide additional context or helpful information.")
    }
}

struct SnowballSwiftExampleTitleLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SnowballSwiftExampleTitleLabelView()
    }
}
