//
//  CALayerExtension.swift
//  til2
//
//  Created by Hitesh Kumar on 27/05/16.
//  Copyright © 2016 Hitesh Kumar. All rights reserved.
//

import Foundation

//extension CALayer {
//    
//    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
//        
//        let border = CALayer()
//        
//        switch edge {
//        case UIRectEdge.top:
//            
//            border.frame = CGRect(x: 0,y: 0, width: CGFloat(self.frame.width), height: thickness)
//            break
//        case UIRectEdge.bottom:
//            border.frame = CGRect(x: 0, y: self.frame.height - thickness, width: self.frame.width, height: thickness)
//            break
//        case UIRectEdge.left:
//            border.frame = CGRect(x: 0, y: 0, width: thickness, height: self.frame.height)
//            break
//        case UIRectEdge.right:
//            border.frame = CGRect(x: self.frame.width - thickness, y: 0, width: thickness, height: self.frame.height)
//            break
//        default:
//            break
//        }
//        
//        border.backgroundColor = color.cgColor;
//        
//        self.addSublayer(border)
//    }
//}
