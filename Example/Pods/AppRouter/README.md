![AppRouter Logo](/logo.png)
![Build Status](https://travis-ci.org/MLSDev/AppRouter.svg?branch=master) &nbsp;
[![codecov.io](http://codecov.io/github/MLSDev/AppRouter/coverage.svg?branch=master)](http://codecov.io/github/MLSDev/AppRouter?branch=master)
![CocoaPod platform](https://cocoapod-badges.herokuapp.com/p/AppRouter/badge.png) &nbsp;
![CocoaPod version](https://cocoapod-badges.herokuapp.com/v/AppRouter/badge.png) &nbsp;
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-brightgreen.svg)](https://github.com/Carthage/Carthage)
[![Packagist](https://img.shields.io/badge/license-MIT-blue.svg)]()

Extremely easy way to handle controller creation / presentation / navigation and reduce coherence in project in general.

## Requirements

- iOS 8.0+
- macOS 10.10+ (RxSwift subspec only)
- Xcode 9+
- Swift 4

## Installation

### CocoaPods

```ruby
pod 'AppRouter'
```

RxSwift extension for AppRouter with life cycle observables:
**Warrning:** RxSwift subspec does not include `Core` anymore.

```ruby
pod 'AppRouter'
pod 'AppRouter/RxSwift'
```

### Carthages

```ruby
github "MLSDev/AppRouter"
```

## Examples

#### Presentations

Imagine that you want to present some controller and for this you need other controller to present on. Usual way forces us to pass controller through weak properties or to use delegation mechanic. We can avoid this situation and just call:

```swift
AppRouter.topViewController?.present(newOne, animated: true, completion: nil)
```  
or even
```swift
newOne.presenter().present()
```

#### Easy accessors
```swift
// provides access to keyWindow (also creates one if current is nil)
AppRouter.window

// root controller in current window stack
AppRouter.rootViewController

// topmost controller
AppRouter.topViewController

// returns instance of passed type if its present in tabBar (even if it's embedded in navigationController)
tabBarController.getControllerInstance<T: UIViewController>(_:) -> T?

// returns instance of passed type if its present in navigationController
navigationController.getControllerInstance<T: UIViewController>(_:) -> T?

// returns true if current controller modally presented
viewController.isModal
```

#### Easy Construction, Configuration, Presentation

Of course it's always better to extract controller creation, configuration and presentation logic out of other controllers and views into FlowControllers or just simple extension methods (if you want this new controller work results - give them completion block or try using **reactive** ways). This will significantly reduce coherence and allow you to modify only one place in whole app to change logic behind feature :

```swift
extension AppRouter {
  static func openGridPictureGalleryControllerWith(pictures: PicturesRepresentation) {
    GridPictureGalleryController.presenter().fromStoryboard("GridPictureGallery").embedInNavigation().configure{
      $0.picturesRepresentation = pictures
    }.present()
  }
  static func openChangePasswordController() {
    ChangePasswordViewController.presenter().push()
  }
}
```

**Note:** framework by default uses name of your UIViewController subclass (String(describing: controllerType)) as storyboard identifier and initial controller (or rootViewController on initial UINavigationController)

#### Completion handlers

In addition to presentation / dismissal completion blocks provided by UiKit, AppRouter provides you completion blocks for pushing/popping controllers onto navigation stack:

```swift
pushViewController(_, animated:, completion:)
popViewController(animated animated:, completion:)
popToViewController(_:, animated:, completion:)
popToRootViewController(animated animated:, completion:)
popToViewController<T: UIViewController>(_:, animated:, completion:)
```

#### Closing controller

Another possible scenario: feature controller that can be pushed or presented in different parts of application. Simplest way to make such controller gone (close button or etc) is to use close method. Just:
```swift
@IBAction func closeTapped(sender: UIButton!) {
  self.close()
}
```
And thats it. Method will try to detect the proper way to make controller gone.

#### RxSwift extensions

If you want some easy way to deal with controller lifecycle outside - try to use AppRouter/RxSwift subspec. It provides a bunch of Type and Instance observables around lifecycle methods (it uses swizzling underneath from the moment you subscribe) :

```swift
instance.rx.onViewDidLoad() -> Observable<Void>
instance.rx.onViewWillAppear() -> Observable<Bool>
instance.rx.onViewDidAppear() -> Observable<Bool>
instance.rx.onViewWillDisappear() -> Observable<Bool>
instance.rx.onViewDidDisappear() -> Observable<Bool>

Type.rx.onViewDidLoad() -> Observable<Type>
Type.rx.onViewWillAppear() -> Observable<(controller: Type, animated: Bool)>
Type.rx.onViewDidAppear() -> Observable<(controller: Type, animated: Bool)>
Type.rx.onViewWillDisappear() -> Observable<(controller: Type, animated: Bool)>
Type.rx.onViewDidDisappear() -> Observable<(controller: Type, animated: Bool)>
```
