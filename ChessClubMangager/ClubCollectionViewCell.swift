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
	
	
	let customBlueColor = UIColor(red: 0/255, green: 96/255, blue: 214/255, alpha: 1.0) /* #0060d6 */
	
	@IBOutlet var backGround: UIView!
	
	@IBOutlet var blueChessPieceImage: UIImageView!
	
    @IBOutlet var unCheckedCircle: UIImageView!
	
	@IBOutlet var clubName: UILabel!
	
	
		
    var strokeColor: UIColor = UIColor.gray
    let lineWth: CGFloat = 2
		
    
    // Edit circle show or hide based on ClubNameVC Editing mode didSet.
    var editing: Bool = false {
        didSet {
            unCheckedCircle.isHidden = !editing
            print("DidSet called on editing button")
        }
    }
    
    // Based on editing mode show Checked/Unchecked image based on cell selection.
    override var isSelected: Bool {
        didSet {
            if editing {
                unCheckedCircle.image = UIImage(named: isSelected ? "Checked" : "Unchecked")
            }
        }
    }
    
    // Draws the rounded rec in each cell.
		override func draw(_ rect: CGRect) {
			let contxt = UIGraphicsGetCurrentContext()

            // Custom blue.
			//let customBlueColor = UIColor(red: 0/255, green: 96/255, blue: 214/255, alpha: 1.0) /* #0060d6 */
            
			// Draw blue gradient of each cell.
            //drawBlueGradient(customBlueColor.cgColor, endColor: UIColor.white.cgColor, inRec: rect)
			//drawBlueGradient(UIColor.blue.cgColor, endColor: UIColor.white.cgColor, inRec: rect)
		
            //drawSolidBlueRect(contxt!, inRec: rect)
			//drawSolidBorder(contxt!, inRec: rect)
			
			
			drawRoundedClearRect(contxt!, inRec: rect)
		}
		
	
    func drawSolidBlueRect(_ contxt: CGContext, inRec: CGRect){
        //let lineWidth: CGFloat = 2.5
        
        let insetRect = inRec.insetBy(dx: 35, dy: 20)
        customBlueColor.set()
        let rectPath = UIBezierPath(rect: insetRect)
        //rectPath.fill()
        
        strokeColor.setStroke()
        
        rectPath.stroke()
        
        let whiteBorder = rectPath.copy()  as! UIBezierPath
        
        whiteBorder.lineWidth = 2
        strokeColor = UIColor.white
        strokeColor.setStroke()
        whiteBorder.stroke()
    }

    func drawRoundedClearRect(_ contxt: CGContext, inRec: CGRect){
        let insetRect = inRec.insetBy(dx: 15, dy: 15)
        let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
        customBlueColor.set()
        let roundedRectPath = UIBezierPath(roundedRect: insetRect, byRoundingCorners: .allCorners, cornerRadii: cornerRadiiValue)
        roundedRectPath.lineWidth = 2
        strokeColor = UIColor.white
        strokeColor.setStroke()
        roundedRectPath.stroke()
    }
    
	func drawBlueGradient(_ startColor: CGColor, endColor: CGColor, inRec: CGRect){
		
		let lineWth: CGFloat = 1
		let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
		let insetRect = inRec.insetBy(dx: 35, dy: 20)
		//let insetRectBy2 = insetRect.insetBy(dx: 1, dy: 1)
		let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: .allCorners, cornerRadii: cornerRadiiValue)
		path.lineWidth = lineWth
		
		
		strokeColor.setStroke()
		path.stroke()
		
		
		
		
		
		let clippingPath = path.copy() as! UIBezierPath
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
	
	
	
	
	
	
	
	
	
	
	
	
	
		func drawSolidBorder(_ contxt: CGContext, inRec: CGRect){
			
			
			
			let lineWth: CGFloat = 1
			let cornerRadiiValue : CGSize = CGSize(width: 10, height: 10)
			let insetRect = inRec.insetBy(dx: 35, dy: 20)
            
            //let insetRect = inRec.insetBy(dx: 20, dy: 50)
			let bottomLine = UIBezierPath()
			
			
			let bottomLineDistanceDownY = insetRect.height * 0.85
			
			let bottomLineLeft: CGPoint = CGPoint(x: insetRect.minX, y: bottomLineDistanceDownY)
			let bottomLineRight: CGPoint = CGPoint(x: insetRect.maxX, y: bottomLineDistanceDownY)
			
			bottomLine.move(to: bottomLineLeft)
			bottomLine.addLine(to: bottomLineRight)
			bottomLine.lineWidth = 1
			
			//		CGContextAddPath(contxt, bottomLine.CGPath);
			//		CGContextSetLineWidth(contxt, 2.0);
			//		CGContextSetBlendMode(contxt, .Lighten)
			//CGContextSetBlendMode(contxt, bottomLine, .blendMode);
			//
			//		CGContextSetShadowWithColor(contxt, CGSizeMake(4.0, 1.0), 2.0, UIColor.blackColor().CGColor)
			
			contxt.strokePath();
			
			
			
			strokeColor.setStroke()
			//bottomLine.stroke()
			
			let path = UIBezierPath(roundedRect: insetRect, byRoundingCorners: .allCorners, cornerRadii: cornerRadiiValue)
			path.lineWidth = lineWth
			
			strokeColor.setStroke()
			path.stroke()
			
			
			
			
			
			
		}
		
		
		
	}
	

