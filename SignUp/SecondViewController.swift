//
//  SecondViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class SecondViewController: UIViewController {

    var essentialFieldList = [UITextField]()
    
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.userID = userID.text
        UserInformation.shared.userPassword = userPassword.text
        UserInformation.shared.checkPassword = checkPassword.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        essentialFieldList = [userID,userPassword,checkPassword]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
