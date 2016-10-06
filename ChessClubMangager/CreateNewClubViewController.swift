//
//  CreateNewClubViewController.swift
//  ChessClubMangager
//
//  Created by Chris Stromberg on 9/20/16.
//  Copyright © 2016 Chris Stromberg. All rights reserved.
//

import UIKit

class CreateNewClubViewController: UIViewController {

    
    var newClubName : String = "No club name given"
    
    var newClubDirector : String = "No club Director name given"
    
    @IBOutlet weak var clubNameTextField: UITextField!
    
    @IBOutlet weak var clubDirectorTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveNewClubButtonPressed(_ sender: AnyObject) {
        
        // Verifies that Club Name and Club Director text fields are filled before allowing saving.
        
        // Entity saved with exit segue

        // If no valid input, alert view is shown with suggestion to fix error.
        if (clubNameTextField.text?.isEmpty)! || (clubDirectorTextField.text?.isEmpty)! {
            
            if (clubDirectorTextField.text?.isEmpty)! {
                
                let alert = UIAlertController(title: "Alert",
                                              message: "Please Enter A Club Director Name.",
                                              preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Click",
                                              style: UIAlertActionStyle.default,
                                              handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            } else {
                
                if (clubNameTextField.text?.isEmpty)! {
                    
                    let alert = UIAlertController(title: "Alert",
                                                  message: "Please Enter A Club Name.",
                                                  preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Click",
                                                  style: UIAlertActionStyle.default,
                                                  handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }

                
            }
            
        } else {
            
            // No empty text fields for Club Name or Director
            // Create the alert asking if players should be added to club at this time.
            
            // Save club and add players later.
            let alert = UIAlertController(title: "Attention!",
                                          message: "Would you like to add players to your club now or later?",
                                          preferredStyle: .alert)
            // Add the actions (buttons) add players, save  and add players later, cancel
            alert.addAction(UIAlertAction(title: "Save This Club And Add Players Later.",
                                          style: UIAlertActionStyle.default,
                                          handler: { action in
                                            
                                            // User clicked save now add players later, move back to club VC
                                            self.performSegue(withIdentifier: "saveNewClubNameAndDirector", sender: self)
            }))
            
            // Segue to VC adding players to club.
            alert.addAction(UIAlertAction(title: "Add Players Now",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
                
            // Cancel alert return to VC and edit entries.
            alert.addAction(UIAlertAction(title: "Cancel",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            // Show alert controller with addActions.
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func exitButtonPressed(_ sender: AnyObject) {
        // Cancels the creation of a new Club and returns to VC.
        self.performSegue(withIdentifier: "UnwindToClubMainView", sender: sender)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveNewClubNameAndDirector" {
            self.newClubName = self.clubNameTextField.text!
            self.newClubDirector = clubDirectorTextField.text!
        }

    }
    
   
    
    
    
    
    
    
    
    
    
    
}
