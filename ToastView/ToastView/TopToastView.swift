//
//  TopToastView.swift
//
//
//  Created by Devendra Agnihotri on 06/02/18.
//  Copyright © 2018 Devendra Agnihotri. All rights reserved.
//

import UIKit


/*
 
 This class represents a white color Toast that is being
 shown and animated from AddToastViewHelper.swift class to indicate
 if remote access is successfully enabled or disabled by user
 
*/

class TopToastView: UIView {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var msgLbl: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func customizeView(withMesg mesg:String){
        mainView.layer.cornerRadius = 12 * CGFloat(UIScreen.main.bounds.height/568)
        mainView.clipsToBounds = true
        msgLbl.text = mesg
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        addShadowAroundBorders()
    }
    
    private func addShadowAroundBorders(){
        let shadowPath = UIBezierPath(rect:mainView.bounds)
        mainView.layer.masksToBounds = false
        mainView.layer.shadowColor = UIColor.black.cgColor
        mainView.layer.shadowOffset = CGSize(width:0, height:5)
        mainView.layer.shadowOpacity = 0.5
        mainView.layer.shadowRadius = 12 * CGFloat(UIScreen.main.bounds.height/568)
        mainView.layer.shadowPath = shadowPath.cgPath
    }
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TopToastView", bundle: nil).instantiate(withOwner: self, options: nil) [0] as! UIView
    }

}
