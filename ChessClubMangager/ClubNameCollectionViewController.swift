//
//  ClubNameCollectionViewController.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/13/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "Cell"

class ClubNameCollectionViewController: UICollectionViewController {
	
	
	//var clubItem = ["Woodside", "Maple Avenue School Test line", "Templeton"]
	var clubItem : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
		//self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

		
		// Removes shadow below navigation bar.
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		
		
		
		// Set font style and size for Nav Bar.
		let fntSiz : CGFloat = 20
		let font = UIFont(name: "Noteworthy-Bold", size: fntSiz)
		if let font = font {
			navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : font, NSForegroundColorAttributeName: UIColor.whiteColor()]
		}
		
		if clubItem.count < 1 {
		self.navigationController?.navigationBar.topItem?.title = "Add a Club"
		} else {
			self.navigationController?.navigationBar.topItem?.title = "Select A Club"
		}
		
		for family: String in UIFont.familyNames()
		{
			print("\(family)")
			for names: String in UIFont.fontNamesForFamilyName(family)
			{
				print("== \(names)")
			}
		}
		
		
		
		
		let width = CGRectGetWidth(collectionView!.frame) / 2
		let layout = collectionViewLayout as! UICollectionViewFlowLayout
		layout.itemSize = CGSize(width: width, height: width)
		
		
		
		
		
		
		
		
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
		
		
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
		
		
			return clubItem.count + 1
		
		
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		//let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
        // Configure the cell
		if indexPath.row == clubItem.count {
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ClubEmptyCell", forIndexPath: indexPath) as! ClubEmptyCollectionViewCell
			// Configure the cell
			
			
			//cell.textLabel!.text = "\(indexPath.row)"
			return cell
			
		} else {
			let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ClubSavedNameCell", forIndexPath: indexPath) as! ClubCollectionViewCell
			
			cell.clubName.text = clubItem[indexPath.row]
			let blueChessLayer = cell.blueChessPieceImage.layer
			
			blueChessLayer.borderColor = UIColor.whiteColor().CGColor
			//blueChessLayer.borderWidth = 2
			let hgt = CGRectGetHeight(cell.blueChessPieceImage.bounds)
			blueChessLayer.cornerRadius = hgt/2
			blueChessLayer.masksToBounds = true
			
			return cell
			
			
			
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
       
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
