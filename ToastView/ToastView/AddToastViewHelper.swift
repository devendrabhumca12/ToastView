//
//  File.swift
//  ToastView
//
//  Created by VVDN on 7/21/19.
//  Copyright © 2019 VVDN. All rights reserved.
//

import Foundation
import UIKit

/* This is a helper class to show and animate TopToastView whenever user enables/disables remote access
 USE:-
 AddToastViewHelper().animateToastView(view:PARENT_VIEW, withMesg:MESSAGE)
 */
class AddToastViewHelper:NSObject{
    
    // Public variable to customize the notification bar/Toast View.
    public var toastBGColor = UIColor.white // By default BG color will show white.
    public var toastTextMsgColor = UIColor.blue // By default BG color will show Blue.
    public var duration = 2.0 // Time duration to show the pop up.By default it is 2.0 seconds
    //You could write your own properties to customize the toast/Banner View.If you face any problem then can contact at devendra.bhumca12@gmail.com
    
    private lazy var popUpView = TopToastView()
    private let height = 46*CGFloat(UIScreen.main.bounds.height/568) // 44 * scale factor
    private var yPosition: NSLayoutConstraint?
    private var superView:UIView?
    
    func animateToastView(view:UIView,withMesg mesg:String){
        self.superView = view
        popUpView = TopToastView.instanceFromNib() as! TopToastView
        popUpView.backgroundColor = toastBGColor
        popUpView.msgLbl.textColor = toastTextMsgColor
        popUpView.translatesAutoresizingMaskIntoConstraints = false
        popUpView.customizeView(withMesg:mesg)
        superView?.addSubview(popUpView)
        addConstraints(item: popUpView, relatedTo:view, center: nil, top: nil, bottom: nil, leading: 0, width: DynamicSizes.screenWidth.getValue(), height: height)
        self.yPosition = NSLayoutConstraint(item: self.popUpView, attribute: .top, relatedBy: .equal, toItem:view, attribute: .top, multiplier: 1, constant: -self.height)
        if let yPos = self.yPosition {
            superView?.addConstraint(yPos)
        }
        
        superView?.layoutIfNeeded()
        
        showPopUpView()
    }
    
    private func showPopUpView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.yPosition?.constant = 30 //top point when it appears on screen
            self.superView?.layoutIfNeeded()
        }) { (success) in
            //Time duration till the banner view show.
            self.delay(self.duration, closure: {
                self.hidePopUpView()
            })
        }
    }
    
    private func hidePopUpView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.yPosition?.constant = -(self.height + 15.0)
            self.superView?.layoutIfNeeded()
        }) { (success) in
            //print("after frame \(self.popUpView.frame)")
        }
    }
    
    /**
     * This method is using to add dynamic constraints.
     *
     * - parameters:
     *   - item: This the object of UIVIew on which constraint is going to add.
     *   - relatedTo: This the object of UIVIew by which constraint is going to add.
     *   - center: This is the value of center constraint.
     *   - top: This is the value of top constraint.
     *   - bottom: This is the value of bottom constraint.
     *   - leading: This is the value of leading constraint.
     *   - width: This is the value of width constraint.
     *   - height: This is the value of height constraint.
     *
     */
    private func addConstraints(item: UIView, relatedTo: UIView, center: CGFloat?, top: CGFloat?, bottom: CGFloat?, leading: CGFloat?, width: CGFloat?, height: CGFloat?)  {
        
        let constraints = NSMutableArray()
        if let center = center {
            let centerVertical = NSLayoutConstraint(item: item, attribute: .centerX, relatedBy: .equal, toItem: relatedTo, attribute: .centerX, multiplier: 1, constant: center)
            if !relatedTo.constraints.contains(centerVertical) {
                constraints.add(centerVertical)
            }
        }
        
        if let leading = leading {
            let leadingConstraint = NSLayoutConstraint(item: item, attribute: .leading, relatedBy: .equal, toItem: relatedTo, attribute: .leading, multiplier: 1, constant: leading)
            if !relatedTo.constraints.contains(leadingConstraint) {
                constraints.add(leadingConstraint)
            }
        }
        
        if let top = top {
            let topConstraint = NSLayoutConstraint(item: item, attribute: .top, relatedBy: .equal, toItem: relatedTo, attribute: .top, multiplier: 1, constant: top)
            if !relatedTo.constraints.contains(topConstraint) {
                constraints.add(topConstraint)
            }
        }
        if let bottom = bottom {
            let bottomConstraint = NSLayoutConstraint(item: item, attribute: .bottom, relatedBy: .equal, toItem: relatedTo, attribute: .bottom, multiplier: 1, constant: -bottom)
            if !relatedTo.constraints.contains(bottomConstraint) {
                constraints.add(bottomConstraint)
            }
        }
        
        if let width = width {
            let widthConstraint = NSLayoutConstraint(item: item, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: width)
            if !relatedTo.constraints.contains(widthConstraint) {
                constraints.add(widthConstraint)
            }
        }
        
        if let height = height {
            let heightConstraint = NSLayoutConstraint(item: item, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: height)
            if !relatedTo.constraints.contains(heightConstraint) {
                constraints.add(heightConstraint)
            }
        }
        relatedTo.addConstraints(constraints as! [NSLayoutConstraint])
    }
    
    enum DynamicSizes: CGFloat {
        case width // To get DynamicItemView width
        case height // To get DynamicItemView height
        case yPosition // To get Y position of DynamicItemView
        case dottedLineHeight // To get height of connection line
        case screenHeight // To get current screen height
        case screenWidth // To get current screen width
        case dynamicHeightCondition // To get dynamic height condition according to current device height
        case dynamicWidthCondition // To get dynamic width condition according to current device width
        case infoBtnYPosition
        
        /**
         * This method is using to get the CGFloat value of selected enum.
         *
         *
         */
        
        func getValue() -> CGFloat {
            switch self {
            case .width:
                return CGFloat(120*(UIScreen.main.bounds.width/320))
            case .height:
                return CGFloat(100*(UIScreen.main.bounds.height/568))
            case .yPosition:
                return CGFloat(50*(UIScreen.main.bounds.height/568))
            case .dottedLineHeight:
                return CGFloat(45*(UIScreen.main.bounds.height/568))
            case .screenWidth:
                return CGFloat(UIScreen.main.bounds.width)
            case .screenHeight:
                return CGFloat(UIScreen.main.bounds.height)
            case .dynamicWidthCondition:
                return CGFloat(UIScreen.main.bounds.width/320)
            case .dynamicHeightCondition:
                return CGFloat(UIScreen.main.bounds.height/568)
            case .infoBtnYPosition:
                return CGFloat(8*(UIScreen.main.bounds.height/568))
            }
        }
    }
    
    func delay(_ delay:Double, closure:@escaping ()->()) {
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
    }
    
}
