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
	
	
	var strokeColor: UIColor = UIColor.lightGray
	let lineWidty: CGFloat = 2
	
    // Custom blue.
    let customBlueColor = UIColor(red: 0/255, green: 96/255, blue: 214/255, alpha: 1.0) /* #0060d6 */
	
    
    
    
	
	override func draw(_ rect: CGRect) {
		
		
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
		
		//drawDashedBorder(c!, inRec: rect)
		//drawSolidBorder(c!, inRec: rect)
		
		drawSolidBlueRect(c!, inRec: rect)
		
		//drawBlueGradinetRect(c!, startColor: UIColor.blue.cgColor , endColor: UIColor.white.cgColor, inRec: rect)
		
	}
	

	
	
	
	
	
	@IBOutlet var imageViewEmptyCell: UIImageView!
	
	
	
	
	func drawShadow(_ contxt: CGContext, inRec: CGRect){
		let context = UIGraphicsGetCurrentContext()
		context?.setLineWidth(20.0)
		context?.setStrokeColor(UIColor.blue.cgColor)
		let dashArray:[CGFloat] = [2,6,4,2]
                //setLineDash(_ pattern: dashArray, count: 3 , phase: 4)
		//CGContextSetLineDash(context, 3, dashArray, 4)
		context?.move(to: CGPoint(x: 10, y: 30))
		
		//CGContextAddQuadCurveToPoint(context, 150, 10, 150, 100)
		context?.strokePath()
		
		
		
		
		
		
	}
	
	func drawSolidBorder(_ contxt: CGContext, inRec: CGRect){
		let lineWth: CGFloat = 2
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		
		let path = UIBezierPath(roundedRect: inRec, byRoundingCorners: .allCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWth
		strokeColor.setStroke()
		path.stroke()
	}
	
	
    // Dashed gray border.
    
	func drawDashedBorder(_ contxt: CGContext, inRec: CGRect){
		let lineWidty: CGFloat = 2.5
		//let insetRect = inRec.insetBy(dx: 20, dy: lineWidty/2)
		let insetRect = inRec.insetBy(dx: 35, dy: 20)
		
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: UIRectCorner.allCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWidty
		
		let dashPattern :[CGFloat] = [10,5]
		let phaseStart: CGFloat = 0
		path.setLineDash( dashPattern, count: 2, phase: phaseStart)
		strokeColor.setStroke()
		path.stroke()

		
	}
	
    
    
    
    func drawSolidBlueRect(_ contxt: CGContext, inRec: CGRect){
        let lineWidth: CGFloat = 2.5
        
        let insetRect = inRec.insetBy(dx: 35, dy: 20)
        customBlueColor.set()
        let rectPath = UIBezierPath(rect: insetRect)
        rectPath.fill()
        
        strokeColor.setStroke()
        
        rectPath.stroke()
    }
    
    // Draw blue shaded rect.
	
    func drawBlueGradinetRect(_ contxt: CGContext, startColor: CGColor, endColor: CGColor, inRec: CGRect){
        let lineWidth: CGFloat = 2.5
        
        let insetRect = inRec.insetBy(dx: 36, dy: 20)
        customBlueColor.set()
        let rectPath = UIBezierPath(rect: insetRect)
        //rectPath.fill()
        strokeColor.setStroke()
        
        rectPath.stroke()
        
        let clippingPath = rectPath.copy() as! UIBezierPath
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
        let endPoint = CGPoint(x:0, y:self.bounds.height * 0.80)
        
        contxt?.drawLinearGradient(gradient!,
                                   start: startPoint,
                                   end: endPoint,
                                   options: .drawsBeforeStartLocation)
        

        
        
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
