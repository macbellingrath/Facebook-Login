//
//  ViewController.swift
//  Facebook-Login
//
//  Created by Mac Bellingrath on 8/30/15.
//  Copyright © 2015 Mac Bellingrath. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    let loginButton = FBSDKLoginButton()
    
    @IBOutlet weak var statusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.center = self.view.center
        self.view.addSubview(loginButton)
        loginButton.readPermissions = ["public_profile", "email", "user_friends"]
        loginButton.delegate = self
    }
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        presentLoginAlertWithStatus("You are now logged in.")
        statusLabel.text = "Logged In"
        
    }
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        presentLoginAlertWithStatus("You have successfully logged out.")
        statusLabel.text = "Logged Out"
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func presentLoginAlertWithStatus(status: String) {
        
        let ac = UIAlertController(title: "Facebook Login", message: status, preferredStyle: .Alert)
       
        ac.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        presentViewController(ac, animated: true, completion: nil)
        
        
        
    }


}

