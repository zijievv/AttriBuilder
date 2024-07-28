//
//  AttributedStringConvertible.swift
//  AttriBuilder
//
//  Created by zijievv on 28/07/2024.
//  Copyright © 2024 zijievv. All rights reserved.
//
//  ====================================================================================================================
//

import Foundation
import SwiftUI

public protocol AttributedStringConvertible {
    var attributedString: AttributedString { get }
}

extension AttributedStringConvertible {
    public func configuring(_ perform: (_ attributedString: inout AttributedString) -> Void) -> AttributedString {
        var attributedString = attributedString
        perform(&attributedString)
        return attributedString
    }

    public func color(_ color: Color) -> AttributedString {
        var container = AttributeContainer()
        container.foregroundColor = color
        return configuring { $0.mergeAttributes(container, mergePolicy: .keepCurrent) }
    }

    public func fontAttribute(_ font: AttributeScopes.SwiftUIAttributes.FontAttribute.Value) -> AttributedString {
        var container = AttributeContainer()
        container.font = font
        return configuring { $0.mergeAttributes(container, mergePolicy: .keepCurrent) }
    }

    public func bold() -> AttributedString {
        configuring { attributedString in
            var inlinePresentationIntent = attributedString.inlinePresentationIntent ?? .init()
            inlinePresentationIntent.insert(.stronglyEmphasized)
            var container = AttributeContainer()
            container.inlinePresentationIntent = inlinePresentationIntent
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }

    public func italic() -> AttributedString {
        configuring { attributedString in
            var inlinePresentationIntent = attributedString.inlinePresentationIntent ?? .init()
            inlinePresentationIntent.insert(.emphasized)
            var container = AttributeContainer()
            container.inlinePresentationIntent = inlinePresentationIntent
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }

    public func strikethrough(_ style: Text.LineStyle = .single) -> AttributedString {
        configuring { attributedString in
            var container = AttributeContainer()
            container.strikethroughStyle = style
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }

    public func underline(
        _ style: AttributeScopes.SwiftUIAttributes.UnderlineStyleAttribute.Value = .single
    ) -> AttributedString {
        configuring { attributedString in
            var container = AttributeContainer()
            container.underlineStyle = style
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }

    public func url(_ url: String) -> AttributedString {
        configuring { attributedString in
            var container = AttributeContainer()
            container.link = URL(string: url)
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }

    public func url(_ url: URL?) -> AttributedString {
        configuring { attributedString in
            var container = AttributeContainer()
            container.link = url
            attributedString.mergeAttributes(container, mergePolicy: .keepCurrent)
        }
    }
}
