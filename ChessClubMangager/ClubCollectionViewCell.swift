//
//  ClubCollectionViewCell.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/13/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

@IBDesignable

class ClubCollectionViewCell: UICollectionViewCell {
	
	
	
	
	@IBOutlet var backGround: UIView!
	
	
	@IBOutlet var blueChessPieceImage: UIImageView!
	
	
	
	@IBOutlet var clubName: UILabel!
	
	
		
		var strokeColor: UIColor = UIColor.grayColor()
		let lineWth: CGFloat = 2
		
		override func drawRect(rect: CGRect) {
			let contxt = UIGraphicsGetCurrentContext()
			
			
			
						
			//
			
			
			
			drawBlueGradient(UIColor.blueColor().CGColor, endColor: UIColor.whiteColor().CGColor, inRec: rect)
			
			
			
			drawSolidBorder(contxt!, inRec: rect)
			
			
			
		}
		
	
	func drawCircleImage(){
		
		
		
		
	}
	
	
	
	
	
	
	
	
	func drawBlueGradient(startColor: CGColor, endColor: CGColor, inRec: CGRect){
		
		
		let lineWth: CGFloat = 1
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		let insetRect = inRec.insetBy(dx: 35, dy: 20)
		//let insetRectBy2 = insetRect.insetBy(dx: 1, dy: 1)
		let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: .AllCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWth
		
		
		strokeColor.setStroke()
		path.stroke()
		
		
		
		
		
		var clippingPath = path.copy() as! UIBezierPath
		clippingPath.addClip()
		
		let contxt = UIGraphicsGetCurrentContext()
		let colors = [startColor, endColor]
		
		//3 - set up the color space
		let colorSpace = CGColorSpaceCreateDeviceRGB()
		
		//4 - set up the color stops
		let colorLocations:[CGFloat] = [0.0, 1.0]
		
		//5 - create the gradient
		let gradient = CGGradientCreateWithColors(colorSpace,
		                                          colors,
		                                          colorLocations)
		
		//6 - draw the gradient
		let startPoint = CGPoint.zero
		let endPoint = CGPoint(x:0, y:self.bounds.height * 0.75)
		
		CGContextDrawLinearGradient(contxt,
		                            gradient,
		                            startPoint,
		                            endPoint,
		                            .DrawsBeforeStartLocation)
	
	
	
		
	
	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
		func drawSolidBorder(contxt: CGContext, inRec: CGRect){
			
			
			
			let lineWth: CGFloat = 1
			let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
			let insetRect = inRec.insetBy(dx: 35, dy: 20)

			let bottomLine = UIBezierPath()
			
			
			let bottomLineDistanceDownY = insetRect.height * 0.85
			
			let bottomLineLeft: CGPoint = CGPoint(x: insetRect.minX, y: bottomLineDistanceDownY)
			let bottomLineRight: CGPoint = CGPoint(x: insetRect.maxX, y: bottomLineDistanceDownY)
			
			bottomLine.moveToPoint(bottomLineLeft)
			bottomLine.addLineToPoint(bottomLineRight)
			bottomLine.lineWidth = 1
			
			//		CGContextAddPath(contxt, bottomLine.CGPath);
			//		CGContextSetLineWidth(contxt, 2.0);
			//		CGContextSetBlendMode(contxt, .Lighten)
			//CGContextSetBlendMode(contxt, bottomLine, .blendMode);
			//
			//		CGContextSetShadowWithColor(contxt, CGSizeMake(4.0, 1.0), 2.0, UIColor.blackColor().CGColor)
			
			CGContextStrokePath(contxt);
			
			
			
			strokeColor.setStroke()
			bottomLine.stroke()
			
			let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: .AllCorners, cornerRadii: cornerRadiiValue)
			path.lineWidth = lineWth
			
			strokeColor.setStroke()
			path.stroke()
			
			
			
			
			
			
		}
		
		
		
	}
	

