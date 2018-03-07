//
//  IntroViewController.swift
//  SplashStrike
//
//  Created by Hong, Sang Ho (홍상호) on 2018. 2. 9..
//  Copyright © 2018년 Hong, Sang Ho (홍상호). All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class IntroViewController: UIViewController {

    var user: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard user != nil else {
            print("user nil")
            return
        }
        
        //txtUserID.text = user.email
        print("FirstViewController:viewDidLoad user : \(String(describing: user?.email))")
        
    }
    
    func gotoLoginViewController(){
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginViewID" ) as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
    }
    
}
