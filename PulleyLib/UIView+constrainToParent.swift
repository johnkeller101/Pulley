//
// UIView+constrainToParent.swift
// Intervals App
//
// Copyright (c) 2025 John Keller
// Created by John Keller on 8/25/17
//

import UIKit

extension UIView {
    func constrainToParent() {
        constrainToParent(insets: .zero)
    }

    func constrainToParent(insets: UIEdgeInsets) {
        guard let parent = superview else { return }

        translatesAutoresizingMaskIntoConstraints = false
        let metrics: [String: Any] = [
            "left": insets.left,
            "right": insets.right,
            "top": insets.top,
            "bottom": insets.bottom
        ]

        parent.addConstraints(["H:|-(left)-[view]-(right)-|", "V:|-(top)-[view]-(bottom)-|"].flatMap {
            NSLayoutConstraint.constraints(withVisualFormat: $0, metrics: metrics, views: ["view": self])
        })
    }
}
