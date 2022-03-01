//
//  SecondViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class SecondViewController: UIViewController {
    
    var essentialFieldList = [UITextField]()
    var a = 0
    
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    @IBOutlet weak var selfIntroduce: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.userID = userID.text
        UserInformation.shared.userPassword = userPassword.text
        UserInformation.shared.checkPassword = checkPassword.text
        UserInformation.shared.selfIntroduce = selfIntroduce.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        essentialFieldList = [userID,userPassword,checkPassword]
        selfIntroduce.delegate = self
        userID.delegate = self
        userPassword.delegate = self
        checkPassword.delegate = self
        nextButton.isEnabled = false
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkEnabledButton() {
        if userID.text?.isEmpty == false && userPassword.text?.isEmpty == false && selfIntroduce.text?.isEmpty == false && userPassword.text == checkPassword.text {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
}

extension SecondViewController: UITextViewDelegate {
    
    func textViewDidEndEditing(_ textView: UITextView) {
        checkEnabledButton()
    }
}

extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkEnabledButton()
    }
}
