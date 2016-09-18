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
    override func drawRect(rect: CGRect) {
        // Drawing code
		var path = UIBezierPath(ovalInRect: rect)
		UIColor.blueColor().setFill()
		path.fill()
		
		//set up width and height variables for horizontal stroke
		let plusHeight: CGFloat = 4.0
		let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
		
		//create path
		var plusPath = UIBezierPath()
		
		//set the path's line width to the height of the stroke
		plusPath.lineWidth = plusHeight
		
		//move the initial point of the path to start of horizontal stroke
		let rightPlusStart: CGPoint = CGPoint(x: bounds.width/2 - plusWidth/2, y: bounds.height/2)
		plusPath.moveToPoint(rightPlusStart)
		
		let leftPlusEnd: CGPoint = CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2)
		plusPath.addLineToPoint(leftPlusEnd)
		
		
		//Vertical Line
		
		//move to the start of the vertical stroke
		plusPath.moveToPoint(CGPoint(
			x:bounds.width/2 ,
			y:bounds.height/2 - plusWidth/2))
		
		//add the end point to the vertical stroke
		plusPath.addLineToPoint(CGPoint(
			x:bounds.width/2,
			y:bounds.height/2 + plusWidth/2))
		
		
		
		
		
		//set the stroke color
		UIColor.whiteColor().setStroke()
		
		//draw
		plusPath.stroke()
		
		
		
		
		
    }
	

}
