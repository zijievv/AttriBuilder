//
//  Paragraph.swift
//  AttriBuilder
//
//  Created by zijievv on 28/07/2024.
//  Copyright © 2024 zijievv. All rights reserved.
//
//  ====================================================================================================================
//

import Foundation

public struct Paragraph: AttributedStringConvertible {
    public let attributedString: AttributedString

    public init(prefixBlankLines: Int = 1, suffixBlankLines: Int = 1, _ attributed: some AttributedStringConvertible) {
        let prefix = AttributedString(String(repeating: "\n", count: max(0, prefixBlankLines)))
        let suffix = AttributedString(String(repeating: "\n", count: max(0, suffixBlankLines)))
        self.attributedString = prefix + attributed.attributedString + suffix
    }

    public init(
        prefixBlankLines: Int = 1,
        suffixBlankLines: Int = 1,
        @AttributedStringBuilder _ content: () -> AttributedString
    ) {
        self.init(prefixBlankLines: prefixBlankLines, suffixBlankLines: suffixBlankLines, content())
    }
}
