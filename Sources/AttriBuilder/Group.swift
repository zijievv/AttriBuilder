//
//  Group.swift
//  AttriBuilder
//
//  Created by zijievv on 28/07/2024.
//  Copyright © 2024 zijievv. All rights reserved.
//
//  ====================================================================================================================
//

import Foundation

public struct Group: AttributedStringConvertible {
    public let attributedString: AttributedString

    public init(_ attributed: some AttributedStringConvertible) {
        self.attributedString = attributed.attributedString
    }

    public init(@AttributedStringBuilder _ content: () -> AttributedString) {
        self.attributedString = content()
    }
}
