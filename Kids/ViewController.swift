//
//  ViewController.swift
//  Kids
//
//  Created by Andrickson Coste on 6/6/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        emailTxt.setCorners(radius: 25)
        passwordTxt.setCorners(radius: 25)
        
    }
    
    
    @IBAction func createBtn(_ sender: UIButton) {
        
        createUser()
        
    }
    
    
    //Functions
    func createUser(){
        
        if let Email = emailTxt.text, let Password = passwordTxt.text {
            Auth.auth().createUser(withEmail: Email, password: Password) { (auth, error) in
                
                if error != nil {
                    
                    print(error?.localizedDescription ?? "error")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "fromCreationToLoggedIn", sender: nil)
                    
                }
                
            }
        }
    }
}

extension UIView {
    func setCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
}

