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
	
	// Core Data array
    var club = Club()
    var clubList = Array<ClubEntity>()
    
    
    // Function to place bottom toolbar with add buttton.
    //let btmView : UIView = BottomCustomButtonView.instanceFromNib()
    
    
//    
//    UIColor(hue: 0.5972, saturation: 0.67, brightness: 0.92, alpha: 1.0) /* #4d8eea */
//    UIColor(hue: 215/360, saturation: 67/100, brightness: 92/100, alpha: 1.0) /* #4d8eea */
//    
//    UIColor(red: 0.302, green: 0.5569, blue: 0.9176, alpha: 1.0) /* #4d8eea */
//    UIColor(red: 77/255, green: 142/255, blue: 234/255, alpha: 1.0) /* #4d8eea */
//    
    
    
    // draws background gradient for current view.
    let draw = DrawingFunctions()
    
    
    
    let bottomCustomBar = BottomCustomButtonView()

    @IBOutlet weak var addClubButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Make blue gradient background.
        
        draw.setBlueGradientBackground(forView: self.view)

		// Hides lower toolbar with delete icon.
		navigationController!.isToolbarHidden = true
        navigationController!.toolbar.isTranslucent = true
        
        navigationItem.leftBarButtonItem = editButtonItem
        
        // Change title of navigationBar based on  Club or no Club.
        self.navigationController?.navigationBar.topItem?.title =
        clubList.count > 1 ? "Add a Club" : "Select A Club"
        
        //Collection view layout
        
        //let width = collectionView!.frame.width / 2
//        let width = collectionView!.frame.width
//        let height = collectionView!.frame.height
//		let layout = collectionViewLayout as! UICollectionViewFlowLayout
//		layout.itemSize = CGSize(width: width, height: height)
//        layout.sectionFootersPinToVisibleBounds = true
        
        
        self.clubList = self.club.getAllEntities()
        self.club.getAllEntitiesByDisplayOrder()

       // self.view.backgroundColor = UIColor.lightGray
        //self.collectionView?.backgroundColor = UIColor(hue: 0.5972, saturation: 0.67, brightness: 0.92, alpha: 1.0) /* #4d8eea */
        
        
        
        // Using the custom BottomCustomButton class function to load and place a bottom bar in the current view. 
        
        bottomCustomBar.placeInstanceFromNib(insideView: self.view)
       
        
        // Removes shadow below navigation bar.
		//self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
		//self.navigationController?.navigationBar.shadowImage = UIImage()
		
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        //collectionView?.contentInset = UIEdgeInsetsMake(30, 0, 0, 0)
        //collectionView?.contentOffset = CGPoint(x: 0, y: 30)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

 
    @IBAction func buttomCustomButtonPressed(_ sender: AnyObject) {
        
//        print("The bottom button has been pressed!!!!")
//        club.addItemToList("New Club Generated")
//        
//        collectionView?.reloadData()
        
        performSegue(withIdentifier: "CreateNewClubSegue", sender: sender)

    }
    
    @IBAction func saveNewClubNameAndDirector(_ segue: UIStoryboardSegue) {
        let tvc = segue.source as! CreateNewClubViewController
        
        let tvcClubName = tvc.newClubName
        let tvcClubDirector = tvc.newClubDirector 
        // Club method to save Club name and Director.
        // Uses properties from CreateNewClubVC
        //self.club.addItemToList("Test of name entered")
        self.club.createNewClub(withName: tvcClubName, andDirector: tvcClubDirector)
        
        // Update changes to Data source
        self.clubList = self.club.getAllEntities()
        
        collectionView?.reloadData()
        
    }
    
    
    @IBAction func unwindToClubMainView(segue: UIStoryboardSegue) {
        
    }
    
    
    
    
    
    
    
    
    
    
    
    // Possibly marked this for removal.
    @IBAction func addClubButtonTapped(_ sender: UIBarButtonItem) {
        
        
        
        
        let indexPaths = collectionView!.indexPathsForSelectedItems! as [IndexPath]
        
            // For every entity that was selected, delete each entity.
            for indexPath in indexPaths {
            
                let clubEntity = self.club.entityList[(indexPath as NSIndexPath).row]
                
                self.club.deleteEntity(clubEntity)
                
        }
            //Need to reload/update entity list after deletions to prevent out of index crashes.
            self.club.entityList = club.getAllEntities()
        
            self.collectionView?.deleteItems(at: indexPaths)
            collectionView?.reloadData()
        
        
        
        
  
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func deleteButtonTapped(_ sender: UIBarButtonItem) {
        
        
        
        let indexPaths = collectionView!.indexPathsForSelectedItems! as [IndexPath]
        
        // For every entity that was selected, delete each entity.
        for indexPath in indexPaths {
            
            let clubEntity = self.club.entityList[(indexPath as NSIndexPath).row]
            
            self.club.deleteEntity(clubEntity)
            
        }
        //Need to reload/update entity list after deletions to prevent out of index crashes.
        self.club.entityList = club.getAllEntities()
        
        self.collectionView?.deleteItems(at: indexPaths)
        collectionView?.reloadData()
        
        
    }
    
    
    
    // Performs segue with identifier established in storyboard.
    // Segues: MasterToClubDetail
    // Segue: CreateNewClubSegue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier else {
            fatalError("Unidentifed Segue")
        }
        
        switch identifier {
            case "MasterToClubDetail": prepareForClubDetailSegue(segue)
        default : break
        }
        
        
        
        if segue.identifier == "MasterToClubDetail" {
            
        }
        
        if segue.identifier == "MasterToClubCreateSegue" {
            let cNewClubControler = segue.destination as! CreateNewClubViewController
            cNewClubControler.navigationController?.title = "Name of Selected Club"
        }
    }

    
    func prepareForClubDetailSegue(_ segue: UIStoryboardSegue) {
        let control = segue.destination as! ClubDetailCollectionViewController
        
       
        
        //let path = collectionView?.path
    }
    // MARK: UICollectionViewDataSource
    
    
    
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        // addButton.isEnabled = !editing
        // Animate the removal or reappearance  of the bottom tool bar based upon editing mode.
        if editing {
            
            let btmVw = view.viewWithTag(100)
            UIView.animate(withDuration: 0.9, delay: 0.3, options: [], animations: {
                btmVw?.center.y += self.view.bounds.height/2
                }, completion: nil)
   
            //view.viewWithTag(100)?.isHidden = true
        } else {
            
            self.navigationController?.setToolbarHidden(true, animated: true)
            
            let btmVw = view.viewWithTag(100)
            UIView.animate(withDuration: 0.9, delay: 0, options: [], animations: {
                btmVw?.center.y -= self.view.bounds.height/2
                }, completion: nil)
        }
       
        collectionView!.allowsMultipleSelection = editing
        
        let indexPaths = collectionView!.indexPathsForVisibleItems as [IndexPath]
        
        for indexPath in indexPaths {
            collectionView!.deselectItem(at: indexPath, animated: false)
            
            
            
            
                let cell = collectionView!.cellForItem(at: indexPath) as? ClubCollectionViewCell
                cell!.editing = editing
            
            
        }
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
//        
//        var addClubCellselectable: Bool = true
//        if (indexPath as NSIndexPath).row == self.club.entityList.count {
//            if isEditing {
//                addClubCellselectable = false
//                return addClubCellselectable
//            } else {
//                return addClubCellselectable
//            }
//        }
//        return addClubCellselectable
//    }

    
    
    
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Did select item at index path \(indexPath)")
        
        if !isEditing {
            navigationController!.setToolbarHidden(true, animated: true)
            
         // Perform segue when UICollectionViewCell is selected in the non-editing mode.
        //
            
            
           // performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
            
            
            
            
            
            
            
            
            
        } else {
            navigationController!.setToolbarHidden(false, animated: true)
        }
    }
    
    // Mark: Table View Data Source
    override func numberOfSections(in collectionView: UICollectionView) -> Int {

        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
        return self.club.entityList.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClubSavedNameCell", for: indexPath) as! ClubCollectionViewCell
			
			//cell.clubName.text = clubItem[(indexPath as NSIndexPath).row]
            let clubEntity = self.club.entityList[(indexPath as NSIndexPath).row]
            cell.clubName.text = clubEntity.clubName
            cell.editing = isEditing
            
            
            
//			let blueChessLayer = cell.blueChessPieceImage.layer
//			
//            blueChessLayer.layoutIfNeeded()
//            
//			blueChessLayer.borderColor = UIColor.white.cgColor
//			//blueChessLayer.borderWidth = 2
//			let hgt = cell.blueChessPieceImage.bounds.height
//			blueChessLayer.cornerRadius = hgt/2
//			blueChessLayer.masksToBounds = true
			
			return cell
			
			
			
		}

    
    
    
    
    
    
    
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//      
//       
//        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ClubFooter", for: indexPath) 
//        
//        
//        footerView.backgroundColor = UIColor.blue
//        return footerView
//
//        
//        
//        
//    }
   // }

    func removeView(withTitle view: UIView) {
        
        let subviews = self.view.subviews
        for view in subviews {
         print(view)
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
