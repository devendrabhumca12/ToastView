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
        AddToastViewHelper().animateToastView(view: self.view, withMesg: "Hello")
        
    }


}
