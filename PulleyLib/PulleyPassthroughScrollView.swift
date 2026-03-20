//
// PulleyPassthroughScrollView.swift
// Intervals App
//
// Copyright (c) 2025 John Keller
// Created by John Keller on 7/8/16
//

import UIKit

protocol PulleyPassthroughScrollViewDelegate: AnyObject {
    func shouldTouchPassthroughScrollView(scrollView: PulleyPassthroughScrollView, point: CGPoint) -> Bool
    func viewToReceiveTouch(scrollView: PulleyPassthroughScrollView, point: CGPoint) -> UIView
}

class PulleyPassthroughScrollView: UIScrollView {
    weak var touchDelegate: PulleyPassthroughScrollViewDelegate?

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if
            let touchDelegate,
            touchDelegate.shouldTouchPassthroughScrollView(scrollView: self, point: point)
        {
            return touchDelegate.viewToReceiveTouch(scrollView: self, point: point).hitTest(
                touchDelegate.viewToReceiveTouch(scrollView: self, point: point).convert(point, from: self),
                with: event
            )
        }

        return super.hitTest(point, with: event)
    }
}
