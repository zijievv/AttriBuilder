//
//  String+Extension.swift
//  AttriBuilder
//
//  Created by zijievv on 28/07/2024.
//  Copyright © 2024 zijievv. All rights reserved.
//
//  ====================================================================================================================
//

import Foundation

extension String: AttributedStringConvertible {
    public var attributedString: AttributedString { .init(self) }
}

extension String {
    public func localizedAttributedString() -> AttributedString {
        .init(localized: .init(self))
    }
}
