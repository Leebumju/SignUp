//
//  SecondViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class SecondViewController: UIViewController {

    var essentialFieldList = [UITextField]()
    var cnt = 0
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var userID: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    @IBOutlet weak var checkPassword: UITextField!
    @IBOutlet weak var selfIntroduce: UITextView!
    @IBOutlet weak var nextButton: UIButton!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    //shared: 싱클톤 패턴
    @IBAction func touchUpSetButton(_ sender: UIButton) {
        UserInformation.shared.userID = userID.text
        UserInformation.shared.userPassword = userPassword.text
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
        
        let settingTap = UITapGestureRecognizer(target: self, action: #selector(settingTapped))
        profileImage.isUserInteractionEnabled = true
        profileImage.addGestureRecognizer(settingTap)

    }
    
    @objc func settingTapped() {
        presentAlbum()
    }
    
    @IBAction func dismissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func checkEnabledButton() {
        if userID.text?.isEmpty == false && userPassword.text?.isEmpty == false && selfIntroduce.text?.isEmpty == false && userPassword.text == checkPassword.text && profileImage.image != nil {
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

extension SecondViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func presentAlbum(){
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        
        present(vc, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("picker -> \(String(describing: info[UIImagePickerController.InfoKey.imageURL]))")
       
        if cnt % 2 == 0 {
            if let image = info[.editedImage] as? UIImage {
                profileImage.image = image
            }
        } else {
            if let image = info[.originalImage] as? UIImage {
                profileImage.image = image
            }
        }
            
        cnt += 1
        print(cnt)
        checkEnabledButton()
        dismiss(animated: true, completion: nil)
    }
        
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}

