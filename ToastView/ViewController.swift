//
//  ViewController.swift
//  ToastView
//
//  Created by Devendra on 7/21/19.
//  Copyright © 2019 Devendra Agnihotri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
        
        
    }


}
