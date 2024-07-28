//
//  AttributedStringBuilder.swift
//  AttriBuilder
//
//  Created by zijievv on 28/07/2024.
//  Copyright © 2024 zijievv. All rights reserved.
//
//  ====================================================================================================================
//

import Foundation
import SwiftUI

@resultBuilder
public enum AttributedStringBuilder {
    public static func buildArray(_ components: [any AttributedStringConvertible]) -> AttributedString {
        components.reduce(into: .init()) { $0.append($1.attributedString) }
    }

    public static func buildBlock() -> AttributedString {
        .init()
    }

    public static func buildBlock(_ components: (any AttributedStringConvertible)...) -> AttributedString {
        buildArray(components)
    }

    public static func buildExpression(_ expression: some AttributedStringConvertible) -> AttributedString {
        expression.attributedString
    }

    public static func buildEither(first component: some AttributedStringConvertible) -> AttributedString {
        component.attributedString
    }

    public static func buildEither(second component: some AttributedStringConvertible) -> AttributedString {
        component.attributedString
    }

    public static func buildOptional(_ component: (some AttributedStringConvertible)?) -> AttributedString {
        component?.attributedString ?? .init()
    }

    public static func buildLimitedAvailability(_ component: some AttributedStringConvertible) -> AttributedString {
        component.attributedString
    }

    public static func buildFinalResult(_ component: some AttributedStringConvertible) -> AttributedString {
        component.attributedString
    }

    public static func buildFinalResult(_ component: some AttributedStringConvertible) -> Text {
        Text(component.attributedString)
    }
}
