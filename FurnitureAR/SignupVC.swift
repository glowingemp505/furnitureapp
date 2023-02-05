//
//  SignupVC.swift
//  FurnitureAR
//
//  Created by Sameer Amjad on 20/01/2023.
//  Copyright © 2023 Sameer Amjad. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase
class SignupVC: BaseVC {

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
    @IBAction func signupbtn(_ sender:UIButton)
    {
        if(emaillbl.text == "" || passwordlbl.text == "" )
        {
            self.showTool(msg: "Fields Empty", state: .error)
            
        }
        else
        {
            Auth.auth().createUser(withEmail: emaillbl.text ?? "", password: passwordlbl.text ?? "") { Result, err in
                if err != nil
                {
                    self.showTool(msg: "Invalid Data", state: .error)
                }
                else
                {
                    print("No Error")
                    let bd = Firestore.firestore()
                    bd.collection("users").addDocument(data: ["first name":self.usernamebl.text , "lastname":self.namelbl.text, "uid": Result!.user.uid]) { (error) in
                        if error != nil
                        {
                            self.showTool(msg: "Invalid Data", state: .error)
                        }
                        else
                        {
                            print("no error")
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                   
                }
            }
        }
       
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
