//
//  BottomCustomButtonView.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/28/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

class BottomCustomButtonView: UIButton {

    // Creates a custom bottom border with a plus button.
    
    override init(frame: CGRect) {
                super.init(frame: frame)
        

    }
   
     required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    class func instanceFromNib() -> UIView {
        
        
        
        
        
       return UINib(nibName: "bottomCustomButtonView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
    }

    
    @IBOutlet weak var bottomBarViewColoredBlue: UIView!
    
    
    // Loads custom toobar with custom add button to bottom of current view.
    func placeInstanceFromNib(insideView view: UIView)  {
        
        
        
        let nibView = UINib(nibName: "bottomCustomButtonView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
        
        let yHeight = view.bounds.height
        let xWidth = view.bounds.width
        
        
        
       
        // View area placed at bottom left corner 90 points up.
        let midRect : CGRect = CGRect.init(x:0, y: yHeight - 90, width: xWidth, height: 90)
        let midView : UIView = UIView.init(frame: midRect)
        
        // Bottom bar displays properly for different orientations.
        midView.autoresizingMask = [ .flexibleWidth, UIViewAutoresizing.flexibleTopMargin]
        view.addSubview(midView)
        // Keeps add button centered in bar view.
        nibView.center = midView.convert(midView.center, from: nibView)
        midView.addSubview(nibView)
        midView.tag = 100
        
        
    }
    
    
    
    
}
