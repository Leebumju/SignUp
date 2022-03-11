//
//  ThirdViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var pickDate: UIDatePicker!
    
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var joinButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let timeSelector : Selector = #selector(ThirdViewController.updateTime)
    let interval = 1.0 // 타이머 간격. 1초
    var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
         self.navigationItem.hidesBackButton = true
    }
    
    @IBOutlet var lblPickerTime: UILabel! // 선택시간 라벨의 아웃렛 변수
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.numberTextField.text = UserInformation.shared.userPhoneNumber
        self.lblPickerTime.text = UserInformation.shared.userBirthDate
        numberTextField.delegate = self
        joinButton.isEnabled = false
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
     
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장
        
        let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
        formatter.dateFormat = "MMM dd, YYYY" // formatter의 dateFormat 속성을 설정
        lblPickerTime.text = formatter.string(from: datePickerView.date)
        // 데이트 피커에서 선택한 날짜를 format에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
        checkEnabledButton()
    }
        
    @IBAction func pushJoinButton(_ sender: Any) {
        UserInformation.shared.userBirthDate = lblPickerTime.text
        UserInformation.shared.userPhoneNumber = numberTextField.text
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pushBackButton(_ sender: Any) {
        UserInformation.shared.userBirthDate = lblPickerTime.text
        UserInformation.shared.userPhoneNumber = numberTextField.text
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushCancelButton(_ sender: Any) {
        UserInformation.shared.userID = nil
        UserInformation.shared.selfIntroduce = nil
        UserInformation.shared.userPassword = nil
        
        self.dismiss(animated: true, completion: nil) //화면 1로 감 취소버튼
    }
    
    @objc func updateTime(){
        let formatter = DateFormatter() // DateFormatter라는 클래스의 상수 formatter를 선언
            
        formatter.dateFormat = "MMM dd, YYYY"
    }
    
    func checkEnabledButton() {
        if numberTextField.text?.isEmpty == false && lblPickerTime.text?.isEmpty == false {
            joinButton.isEnabled = true
        } else {
            joinButton.isEnabled = false
        }
    }
    
}


extension ThirdViewController: UITextFieldDelegate {

    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkEnabledButton()
    }
}


