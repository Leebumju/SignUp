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


    
    @IBAction func checkEmptyID(_ sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        }
    }
    
    @IBAction func checkEmptyPassword(_ sender: UITextField) {
        if sender.text?.isEmpty == true {
            nextButton.isEnabled = false
        }
    }
    // 이게 최종체크를 여기서만 하니까 문제가 발생하네 , delegate써서 하는게 더 좋을듯??
    @IBAction func checklEqualPassword(_ sender: UITextField) {
        if sender.text?.isEmpty == false && userPassword.text == sender.text && a == 1 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
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
        nextButton.isEnabled = false
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension SecondViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        a = 1
    }
}
