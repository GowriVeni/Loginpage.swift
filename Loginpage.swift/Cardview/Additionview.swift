//
//  Additionview.swift
//  Loginpage.swift
//
//  Created by MMKG on 08/12/23.
//

import UIKit

@IBDesignable class Additionview: UIView {
    
    @IBInspectable var cornerradius : CGFloat = 2
    @IBInspectable var shadowOffSetWidth : CGFloat = 0
    @IBInspectable var shadowOffSetHiegth : CGFloat = 5
    @IBInspectable var shadowColor : UIColor = UIColor.black
    @IBInspectable var shadowOPacity : CGFloat = 0.5
    
    override func layoutSubviews() {
        //self.addBorder(.right, colour: .label, thickness: 1)
       // self.addBorder(.left, colour: .label, thickness: 1)
        //self.addBorder(.top, colour: .label, thickness: 1)
        //self.addBorder(.bottom, colour: .label, thickness: 1)
        layer.cornerRadius = cornerradius
        layer.shadowColor =  shadowColor.cgColor
        layer.shadowOffset = CGSize(width: shadowOffSetWidth, height: shadowOffSetHiegth)
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerradius)
        layer.shadowPath = shadowPath.cgPath
        layer.shadowOpacity = Float(shadowOPacity)
        
    }
}
/*extension UIView{
    func addBorder(_ edge: UIRectEdge, colour: UIColor, thickness: CGFloat){
        let subview = UIView()
        subview.translatesAutoresizingMaskIntoConstraints=false
        subview.backgroundColor = colour
        self.addSubview (subview)
        
        switch edge
        {
        case .top, .bottom:
            subview.leftAnchor.constraint (equalTo: self.leftAnchor, constant: 0).isActive = true
            subview.rightAnchor.constraint (equalTo: self.rightAnchor, constant: 0).isActive = true
            subview.heightAnchor.constraint (equalToConstant: thickness).isActive = true
            if edge == .top{
                subview.topAnchor.constraint (equalTo: self.topAnchor, constant: 0).isActive = true
            }else
            {
                subview.bottomAnchor.constraint (equalTo: self.bottomAnchor, constant: 0).isActive = true
                }
        case .left, .right:
            
                subview.topAnchor.constraint (equalTo: self.topAnchor, constant: 0).isActive = true
                subview.bottomAnchor.constraint (equalTo: self.bottomAnchor, constant: 0).isActive = true
                subview.widthAnchor.constraint (equalToConstant: thickness) .isActive = true
                if edge == .left
                {
                    subview.leftAnchor.constraint (equalTo: self.leftAnchor, constant: 0).isActive = true
                }
                else
                    {
                    subview.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
                }
                default:
                    break
                    
                }
            }
        }*/
