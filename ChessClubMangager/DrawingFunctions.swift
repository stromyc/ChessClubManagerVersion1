//
//  DrawingFunctions.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 10/10/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

class DrawingFunctions {
    
    func drawBackGroundGradient (forBackGround view: UIView, startColor: UIColor, endColor: UIColor){
        
        let viewBoundsPath = view.bounds
        let viewBoundsRect = UIBezierPath(rect: viewBoundsPath)
        let clippingPath = viewBoundsRect.copy() as! UIBezierPath
        clippingPath.addClip()
        
        let contxt = UIGraphicsGetCurrentContext()
        let colors = [startColor, endColor]
        
        //3 - set up the color space
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        //4 - set up the color stops
        let colorLocations:[CGFloat] = [0.2, 1.0]
        
        //5 - create the gradient
        let gradient = CGGradient(colorsSpace: colorSpace,
                                  colors: colors as CFArray,
                                  locations: colorLocations)
        
        //6 - draw the gradient
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:view.bounds.height * 0.80)
        
        contxt?.drawLinearGradient(gradient!,
                                   start: startPoint,
                                   end: endPoint,
                                   options: .drawsBeforeStartLocation)
    }
    
    
    func setBlueGradientBackground(forView view: UIView) {
        //        let colorTop =  UIColor(red: 255.0/255.0, green: 149.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        //        let colorBottom = UIColor(red: 255.0/255.0, green: 94.0/255.0, blue: 58.0/255.0, alpha: 1.0).cgColor
        
        // let colorTop = UIColor.white.cgColor
        
        let colorTop = UIColor(red: 0/255, green: 96/255, blue: 214/255, alpha: 1.0).cgColor /* #0060d6 */
        let colorBottom =  UIColor(red: 77/255, green: 142/255, blue: 234/255, alpha: 1.0).cgColor /* #4d8eea */
        
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 0.8]
        gradientLayer.frame = view.bounds
        
        //self.view.layer.addSublayer(gradientLayer)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
    
    }

}
