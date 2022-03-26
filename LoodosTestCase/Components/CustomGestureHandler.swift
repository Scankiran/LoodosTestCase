//
//  CustomGestureHandler.swift
//  LoodosTestCase
//
//  Created by Said Çankıran on 26.03.2022.
//

import UIKit

typealias OnTapClosure = (UITapGestureRecognizer) -> Void

public extension UIView {

    func onTap(_ handler: @escaping (UITapGestureRecognizer) -> Void) {
        addGestureRecognizer(UITapGestureRecognizer(taps: 1, handler: handler))
    }

    func onDoubleTap(_ handler: @escaping (UITapGestureRecognizer) -> Void) {
        addGestureRecognizer(UITapGestureRecognizer(taps: 2, handler: handler))
    }

    func onSwipeLeft(_ handler: @escaping (UISwipeGestureRecognizer) -> Void) {
        addGestureRecognizer(UISwipeGestureRecognizer(direction: .left, handler: handler))
    }

    func onSwipeRight(_ handler: @escaping (UISwipeGestureRecognizer) -> Void) {
        addGestureRecognizer(UISwipeGestureRecognizer(direction: .right, handler: handler))
    }

}

public extension UITapGestureRecognizer {

    /**
        Initializes a touch gesture-recognizer with the specificed number of taps, touches and handler
     */
    convenience init(taps: Int = 1, touches: Int = 1, handler: @escaping (UITapGestureRecognizer) -> Void) {
        let handler = ClosureHandler<UITapGestureRecognizer>(handler: handler)
        self.init(target: handler, action: ClosureHandlerSelector)
        setHandler(self, handler: handler)
        numberOfTapsRequired = taps
        numberOfTouchesRequired = touches
    }
}

public extension UISwipeGestureRecognizer {

    /**
        Initializes a swipe gesture recognizer with the specificed direction and handler
     */
    convenience init(direction: UISwipeGestureRecognizer.Direction, handler: @escaping (UISwipeGestureRecognizer) -> Void) {
        let handler = ClosureHandler<UISwipeGestureRecognizer>(handler: handler)
        self.init(target: handler, action: ClosureHandlerSelector)
        setHandler(self, handler: handler)
        self.direction = direction
    }
}

private var HandlerKey: UInt8 = 0

internal extension UIGestureRecognizer {

    func setHandler<T: UIGestureRecognizer>(_ instance: T, handler: ClosureHandler<T>) {
        objc_setAssociatedObject(self, &HandlerKey, handler, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        handler.control = instance
    }

    func handler<T>() -> ClosureHandler<T> {
        return objc_getAssociatedObject(self, &HandlerKey) as! ClosureHandler
    }
}


internal let ClosureHandlerSelector = Selector(("handle"))

internal class ClosureHandler<T: AnyObject>: NSObject {

    internal var handler: ((T) -> Void)?
    internal weak var control: T?

    internal init(handler: @escaping (T) -> Void, control: T? = nil) {
        self.handler = handler
        self.control = control
    }

    @objc func handle() {
        if let control = self.control {
            handler?(control)
        }
    }
}

