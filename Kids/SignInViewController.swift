//
//  SignInViewController.swift
//  Kids
//
//  Created by Andrickson Coste on 6/7/21.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTxt.setCorners(radius: 25)
        passwordTxt.setCorners(radius: 25)

    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
        
        SignIn()
        
    }
    
    func SignIn() {
        
        if let Email = emailTxt.text, let Password = passwordTxt.text {
            
            Auth.auth().signIn(withEmail: Email, password: Password) { (auth, error) in
                
                if error != nil {
                    print(error?.localizedDescription ?? "error")
                } else {
                    
                    self.performSegue(withIdentifier: "showAlreadySignedIn", sender: nil)
                    
                }
            }
        }
    }
}
