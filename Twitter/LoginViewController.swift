//
//  LoginViewController.swift
//  Twitter
//
//  Created by David Abarca on 10/5/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBAction func onLoginButton(_ sender: Any) {
        
        // Log into Twitter account
        let myUrl = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myUrl, success: {
            // we want to go from the login screen to home screen
            // so we need to trigger the segue loginToHome
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            // We want to remember that the user logged in so that next
            // time they don't have to login again
            UserDefaults.standard.setValue(true, forKey: "userLoggedIn")
        }, failure: { (Error) in
            print("Could not login...")
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Check the value of userLoggedIn and if it is true, meaning
        // they are logged in, continue to the home screen
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
