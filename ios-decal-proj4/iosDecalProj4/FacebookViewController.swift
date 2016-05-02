//
//  ViewController.swift
//  iosDecalProj4
//
//  Created by David Kong on 4/29/16.
//  Copyright © 2016 David Kong. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class FacebookViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        // Facebook access
        if (FBSDKAccessToken.currentAccessToken() != nil) {
            performSegueWithIdentifier("leSegue", sender: self)
        }
        else {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "user_friends"]
            loginView.delegate = self
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil) {
            exit(-1)
        }
        else if result.isCancelled {
            // Do nothing if cancelled
        }
        else {
            performSegueWithIdentifier("leSegue", sender: self)
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {}
}
