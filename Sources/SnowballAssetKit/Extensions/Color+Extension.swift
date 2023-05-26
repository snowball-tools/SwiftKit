//
//  File.swift
//  
//
//  Created by Vivian Phung on 5/25/23.
//

import SwiftUI

public func SnowballCustomColor(_ name: String) -> Color {
    Color(UIColor(named: name, in: Bundle.module, compatibleWith: nil)!)
}
