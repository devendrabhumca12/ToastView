# ToastView
The easiest way to display highly customizable in app notification banners in iOS for iOS9.0 + in swift


# Features
    Highly customizable ✅
    NSAttributedString support ✅
    iPhone, iPhoneX, & iPad Support ✅
    Orientation change support ✅
    Custom UIView support ✅
    Custom colors support ✅
    Support for long titles/ subtitles ✅
    Presenting from top support ✅
    
# Requirements
iOS 9.0+
Xcode 10.0+
Swift 5.0 +

# Installation

Just drag and drop the ToastView folder into your project folder that's it.

# Usage

Creating NotificationBanner/Top banner is used to easy. To create a regular banner and show it, simply:

    let banner = AddToastViewHelper().animateToastView(view: self.view, withMesg: title)

By default, each banner will automatically dismiss after 5 seconds. To dismiss programatically, simply:

    banner.dismissToast()

To show a banner infinitely until it is manually dismissed, simply:

    banner.autoDismiss = false

Each side view will be automically reisized to fit perfectly


Feel free to add yours!

# Author

    Devendra Agnihotri, devendra.bhumca12@gmail.com

