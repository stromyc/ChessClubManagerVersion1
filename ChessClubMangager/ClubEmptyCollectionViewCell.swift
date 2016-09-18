//
//  ClubEmptyCollectionViewCell.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/13/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

@IBDesignable

class ClubEmptyCollectionViewCell: UICollectionViewCell {
	
	
	var strokeColor: UIColor = UIColor.lightGrayColor()
	let lineWidty: CGFloat = 2
	
	
	
	
	override func drawRect(rect: CGRect) {
		
		
		//		let insetRect = rect.insetBy(dx: 30, dy: 20)
		//		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		//		let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: cornerRadiiValue)
		//
		//
		//		path.lineWidth = lineWidty
		//		strokeColor.setStroke()
		//		path.stroke()
		
//		let xStartPoint : CGFloat = rect.width/2 - 25
//		let yStartPoint : CGFloat = rect.height/2 - 20
//		
//		let shawdowLocation = CGSize(width: 10, height: 10)
		let c = UIGraphicsGetCurrentContext()
		
		
		
		//CGContextAddRect(c, CGRectMake(xStartPoint, yStartPoint, 50, 40))
		
//		CGContextSetStrokeColorWithColor(c , UIColor.redColor().CGColor)
//		CGContextStrokePath(c)
		
		//drawShadow(c!, inRec: rect)
		
		drawDashedBorder(c!, inRec: rect)
		//drawSolidBorder(c!, inRec: rect)
		
		
		
		
		
	}
	

	
	
	
	
	
	@IBOutlet var imageViewEmptyCell: UIImageView!
	
	
	
	
	func drawShadow(contxt: CGContext, inRec: CGRect){
		let context = UIGraphicsGetCurrentContext()
		CGContextSetLineWidth(context, 20.0)
		CGContextSetStrokeColorWithColor(context,
		                                 UIColor.blueColor().CGColor)
		let dashArray:[CGFloat] = [2,6,4,2]
		CGContextSetLineDash(context, 3, dashArray, 4)
		CGContextMoveToPoint(context, 10, 30)
		
		//CGContextAddQuadCurveToPoint(context, 150, 10, 150, 100)
		CGContextStrokePath(context)
		
		
		
		
		
		
	}
	
	func drawSolidBorder(contxt: CGContext, inRec: CGRect){
		let lineWth: CGFloat = 2
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		
		let path = UIBezierPath(roundedRect: inRec, byRoundingCorners: .AllCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWth
		strokeColor.setStroke()
		path.stroke()
	}
	
	// Set up cell to toggle this border. So if the cell has a flag set call this method otherwise set a different border.
	func drawDashedBorder(contxt: CGContext, inRec: CGRect){
		let lineWidty: CGFloat = 2.5
		//let insetRect = inRec.insetBy(dx: 20, dy: lineWidty/2)
		let insetRect = inRec.insetBy(dx: 35, dy: 20)
		
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: UIRectCorner.AllCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWidty
		
		let dashPattern :[CGFloat] = [10,5]
		let phaseStart: CGFloat = 0
		path.setLineDash( dashPattern, count: 2, phase: phaseStart)
		strokeColor.setStroke()
		path.stroke()
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	@IBOutlet weak var textLabel: UILabel!
	
	//
	//	let superviewCell = UIView(frame: CGRectMake(0, 0, 200, 200))
	//
	//	let shadowView = UIView(frame: CGRectMake(50, 50, 100, 100))
	//	shadowView.layer.shadowColor = UIColor.blackColor().CGColor
	//	shadowView.layer.shadowOffset = CGSizeZero
	//	shadowView.layer.shadowOpacity = 0.5
	//	shadowView.layer.shadowRadius = 5
	//
	//	let view = MyView(frame: shadowView.bounds)
	//	view.backgroundColor = UIColor.whiteColor()
	//	view.layer.cornerRadius = 10.0
	//	view.layer.borderColor = UIColor.grayColor().CGColor
	//	view.layer.borderWidth = 0.5
	//	view.clipsToBounds = true
	//
	//	shadowView.addSubview(view)
	//	superview.addSubview(shadowView)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    
}
