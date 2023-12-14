//
//  cardview.swift
//  Loginpage.swift
//
//  Created by MMKG on 07/12/23.
//

import UIKit

@IBDesignable class cardview: UIView {
    @IBInspectable var cornerradius : CGFloat = 2
    @IBInspectable var shadowOffSetWidth : CGFloat = 0
    @IBInspectable var shadowOffSetHiegth : CGFloat = 5
    @IBInspectable var shadowColor : UIColor = UIColor.black
    @IBInspectable var shadowOPacity : CGFloat = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerradius
        layer.shadowColor =  shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHiegth)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOPacity)
        
    }
}
