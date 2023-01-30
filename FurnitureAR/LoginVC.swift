//
//  LoginVC.swift
//  FurnitureAR
//
//  Created by Sameer Amjad on 20/01/2023.
//  Copyright © 2023 Sameer Amjad. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var passwordimg : UIButton!
    @IBOutlet weak var passwordlbl : UITextField!
    @IBOutlet weak var emaillbl : UITextField!
    var check = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func btn(_ sender:UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func signupbtn(_ sender:UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignupVC") as! SignupVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func pwdbtn(_ sender:UIButton)
    {
        if check == 0
        {
            passwordimg.setImage(UIImage(named: "ic-unhide"), for: .normal)
            check = 1
            passwordlbl.isSecureTextEntry = false
        }
        else
        {
            passwordimg.setImage(UIImage(named: "ic-hide"), for: .normal)
            check = 0
            passwordlbl.isSecureTextEntry = true
        }
    }
}
