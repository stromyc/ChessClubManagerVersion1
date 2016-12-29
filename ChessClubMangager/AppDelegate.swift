//
//  AppDelegate.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/9/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

    
    
    /*
     UIColor(hue: 0.5917, saturation: 1, brightness: 0.84, alpha: 1.0) /* #0060d6 */
     UIColor(hue: 213/360, saturation: 100/100, brightness: 84/100, alpha: 1.0) /* #0060d6 */
     
     UIColor(red: 0, green: 0.3765, blue: 0.8392, alpha: 1.0) /* #0060d6 */
     UIColor(red: 0/255, green: 96/255, blue: 214/255, alpha: 1.0) /* #0060d6 */
     */
    
    
    
    
    

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
        
        // Set buttons, font, style and size for Nav Bar.
        
        
        let navigationBarAppearace = UINavigationBar.appearance()
        
        navigationBarAppearace.tintColor = UIColor.white
        navigationBarAppearace.barTintColor = UIColor.blue
        navigationBarAppearace.barTintColor = UIColor(red: 0, green: 0.3765, blue: 0.8392, alpha: 1.0) /* #0060d6 */

       UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        
        
        
        
        
        let fntSiz : CGFloat = 20
        //let font = UIFont(name: "Noteworthy-Bold", size: fntSiz)
        let font = UIFont(name: "AppleSDGothicNeo-Medium", size: fntSiz)
        if let font = font {
            
            let navigationController = application.windows[0].rootViewController as! UINavigationController

            let widthView = window?.bounds.width
            
            navigationController.navigationBar.frame =  CGRect.init(x: 0, y: 0, width: widthView!, height: 80)  
            navigationController.navigationBar.titleTextAttributes = [NSFontAttributeName : font,
                                                                       NSForegroundColorAttributeName: UIColor.white]
            
        }
        
    let statusWidth = UIApplication.shared.statusBarFrame.width
        let statusHeight = UIApplication.shared.statusBarFrame.height
        
        let statusBarBackGroundRect: CGRect = CGRect.init(x: 0, y: 0, width: statusWidth, height: statusHeight)
        let statusBarBackGroundView: UIView = UIView.init(frame: statusBarBackGroundRect)
        statusBarBackGroundView.backgroundColor = UIColor.blue
        statusBarBackGroundView.alpha = 1
        statusBarBackGroundView.autoresizingMask = [ .flexibleWidth, UIViewAutoresizing.flexibleTopMargin]
        //self.window!.rootViewController!.view.addSubview(statusBarBackGroundView)
//        let statusBarBackGroundView: UIView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIApplication.shared.statusBarFrame.height)
        
       
            
            
            
//        .backgroundColor = UIColor.blackColor  //The colour you want to set
//        
//        view.alpha = 0.1   //This and the line above is set like this just if you want
//        the status bar a darker shade of
//        the colour you already have behind it.
//        
//        self.window!.rootViewController!.view.addSubview(view)
        
        
        
        
        
        
		return true
	}

	func applicationWillResignActive(_ application: UIApplication) {
		// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
		// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
	}

	func applicationDidEnterBackground(_ application: UIApplication) {
		// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
		// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
	}

	func applicationWillEnterForeground(_ application: UIApplication) {
		// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
	}

	func applicationDidBecomeActive(_ application: UIApplication) {
		// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
	}

	func applicationWillTerminate(_ application: UIApplication) {
		// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
	}


}

