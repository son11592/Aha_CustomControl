import Foundation
import UIKit

extension AppRouter {
    /// Current keyWindow rootViewController
    open var rootViewController : UIViewController? {
        get { return window.rootViewController }
        set { window.rootViewController = newValue }
    }
    
    /// Current topmost controller
    open var topViewController : UIViewController? {
        return topViewController()
    }
    
    /// recursively tries to detect topmost controller
    /// - parameter startingFrom: Specify controller which will be used as start point for searching
    /// - returns: returns top-most controller if exists
    open func topViewController(startingFrom base: UIViewController? = rootViewController) -> UIViewController? {
        if let topper = base?.toppestControllerFromCurrent() { return topViewController(startingFrom: topper) ?? base }
        return base
    }
    
    // Backwards compatibility part
    
    /// Current keyWindow rootViewController
    public class var rootViewController : UIViewController? {
        get { return AppRouter.shared.rootViewController }
        set { AppRouter.shared.rootViewController = newValue }
    }
    
    /// Current topmost controller
    public class var topViewController : UIViewController? {
        return topViewController()
    }
    
    /// recursively tries to detect topmost controller
    /// - parameter startingFrom: Specify controller which will be used as start point for searching
    /// - returns: returns top-most controller if exists
    public class func topViewController(startingFrom base: UIViewController? = rootViewController) -> UIViewController? {
        return AppRouter.shared.topViewController(startingFrom: base)
    }
}

public protocol ARToppestControllerProvider {
    func toppestControllerFromCurrent() -> UIViewController?
}
extension UIViewController : ARToppestControllerProvider {
    /// ARToppestControllerProvider implementation
    ///
    /// - returns: presentedViewController
    @objc open func toppestControllerFromCurrent() -> UIViewController? {
        return self.presentedViewController
    }
}
extension UINavigationController {
    /// ARToppestControllerProvider implementation
    ///
    /// - returns: visibleViewController
    override open func toppestControllerFromCurrent() -> UIViewController? {
        return self.visibleViewController
    }
}
extension UITabBarController {
    /// ARToppestControllerProvider implementation
    ///
    /// - returns: selectedViewController
    override open func toppestControllerFromCurrent() -> UIViewController? {
        return self.selectedViewController ?? presentedViewController
    }
}


extension UITabBarController {
    /// returns viewController of specified type if available
    ///
    /// - parameter type: Controller type
    /// - returns: one of viewControllers with specified type.
    public func getControllerInstance<T: UIViewController>(_ type: T.Type) -> T?{
        for controller in self.viewControllers ?? [] {
            if let reqController = controller as? T {
                return reqController
            } else if let navController = controller as? UINavigationController {
                if let reqController = navController.viewControllers.first as? T {
                    return reqController
                }
            }
        }
        return nil
    }
}

extension UINavigationController {
    /// returns viewController of specified type if available
    ///
    /// - parameter type: Controller type
    /// - returns: one of viewControllers with specified type.
    public func getControllerInstance<T: UIViewController>(_ type: T.Type) -> T?{
        for controller in self.viewControllers {
            if let reqController = controller as? T {
                return reqController
            }
        }
        return nil
    }
}

extension UIViewController {
    /// Easy way to detect if controller is modaly presented
    ///
    /// - returns: true - if controller or its navigationController / tabBarController is modaly presented
    public var isModal : Bool {
        return presentingViewController?.presentedViewController == self
            || navigationController?.isModal ?? false
            || tabBarController?.presentingViewController is UITabBarController
    }
}

