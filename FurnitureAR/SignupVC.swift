//
//  SignupVC.swift
//  FurnitureAR
//
//  Created by Sameer Amjad on 20/01/2023.
//  Copyright © 2023 Sameer Amjad. All rights reserved.
//

import UIKit

class SignupVC: UIViewController {

    @IBOutlet weak var passwordimg : UIButton!
    @IBOutlet weak var passwordlbl : UITextField!
    @IBOutlet weak var emaillbl : UITextField!
    @IBOutlet weak var usernamebl : UITextField!
    @IBOutlet weak var namelbl : UITextField!
    var check = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btn(_ sender:UIButton)
    {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func backbtn(_ sender:UIButton)
    {
        self.navigationController?.popViewController(animated: true)
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
