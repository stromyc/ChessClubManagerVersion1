//
//  PushButtonView.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/15/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {

	
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        
		let path = UIBezierPath(ovalIn: rect)
        let customBlue : UIColor = UIColor(red: 0, green: 0.3765, blue: 0.8392, alpha: 1.0) /* #0060d6 */
		customBlue.setFill()
		path.fill()
		
    
//        let borderOfCircle = path.copy() as! UIBezierPath
//        
//        borderOfCircle.lineWidth = 2
//        UIColor.white.setStroke()
//        borderOfCircle.stroke()
        
        
		//set up width and height variables for horizontal stroke
		let plusHeight: CGFloat = 4.0
		let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
		
		//create path
		let plusPath = UIBezierPath()
		
		//set the path's line width to the height of the stroke
		plusPath.lineWidth = plusHeight
		
		//move the initial point of the path to start of horizontal stroke
		let rightPlusStart: CGPoint = CGPoint(x: bounds.width/2 - plusWidth/2, y: bounds.height/2)
		plusPath.move(to: rightPlusStart)
		
		let leftPlusEnd: CGPoint = CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2)
		plusPath.addLine(to: leftPlusEnd)
		
		
		//Vertical Line
		
		//move to the start of the vertical stroke
		plusPath.move(to: CGPoint(
			x:bounds.width/2 ,
			y:bounds.height/2 - plusWidth/2))
		
		//add the end point to the vertical stroke
		plusPath.addLine(to: CGPoint(
			x:bounds.width/2,
			y:bounds.height/2 + plusWidth/2))
		
		
		
		
		
		//set the stroke color
		UIColor.white.setStroke()
		
		//draw
		plusPath.stroke()
		
		
		
		
		
    }
	
    
}
