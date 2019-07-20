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

    AddToastViewHelper().animateToastView(view: self.view, withMesg: title)

        // Will dismiss after 5 seconds.
        //AddToastViewHelper().animateToastView(view: self.view, withMesg: "This is a simple test Message.")
        
        //show banner for 3 seconds.
        //AddToastViewHelper().animateToastView(view: self.view, withMesg: "This is a simple test Message.", withDuration: 3.0)
        
        //Show banner view with customize BG  color
        //AddToastViewHelper().animateToastView(view: self.view, withMesg: "This is a simple test Message.", withDuration: 3.0, withBGColor: UIColor.green)
        
        //Show banner view with custom message color
        //AddToastViewHelper().animateToastView(view: self.view, withMesg: "This is a simple test Message.", withDuration: 3.0, withBGColor: UIColor.green, withTextMsgColor: UIColor.white)
        
        //this will not dismiss automatically. Infinite showing banner message.
        //AddToastViewHelper().animateToastView(view: self.view, withMesg: "This is a simple test Message.", withDuration: 3.0, withBGColor: UIColor.green, withTextMsgColor: UIColor.white, autoDismiss: false)
        
        //Dismiss loader manually.
        //AddToastViewHelper().dismissToast()

Each side view will be automically reisized to fit perfectly


Feel free to add yours!

# Author

    Devendra Agnihotri, devendra.bhumca12@gmail.com

