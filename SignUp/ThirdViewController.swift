//
//  ThirdViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var pickDate: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    let timeSelector : Selector = #selector(ThirdViewController.updateTime)
        let interval = 1.0 // 타이머 간격. 1초
        var count = 0 // 타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수
     
        @IBOutlet var lblCurrentTime: UILabel! // 현재시간 라벨의 아웃렛 변수
        @IBOutlet var lblPickerTime: UILabel! // 선택시간 라벨의 아웃렛 변수
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            // 타이머 설정
            Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        }
     
        @IBAction func changeDatePicker(_ sender: UIDatePicker) {
            let datePickerView = sender // 전달된 인수 저장
            
            let formatter = DateFormatter() // DateFormatter 클래스 상수 선언
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE" // formatter의 dateFormat 속성을 설정
            label.text = "선택시간 : " + formatter.string(from: datePickerView.date)
            // 데이트 피커에서 선택한 날짜를 format에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
        }
        
        @objc func updateTime(){
            // count 값을 문자열로 변환하여 lblCurrentTime.text에 출력
    //        lblCurrentTime.text = String(count)
    //        count = count + 1 // count 값을 1 증가
            let date = NSDate() // 현재 시간을 가져옴
            
            
            let formatter = DateFormatter() // DateFormatter라는 클래스의 상수 formatter를 선언
            
            formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
            // 상수 formatter의 dateFormat 속성을 설정
            // 현재날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
            label.text = "현재시간 : "+formatter.string(from: date as Date)
            // 문자열로 변한한 date 값을 "현재시간:"이라는 문자열에 추가하고 그 문자열을 lblCurrentTime의 text에 입력
        }
    
    
    
  /*  @IBOutlet weak var datePicker: UIPickerView!
    
    var colors = [["January","February","March","April","May","June","July","August","September","October","November","December"],["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"],
        ["1990","1991","1992","1993","1994","1995","1996","1997","1998","1999","2000","2001","2002","2003","2004","2005"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.text = UserInformation.shared.userID
        self.datePicker.dataSource = self
        self.datePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors[component].count * 100
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[component][row % colors[component].count]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(colors[component][row])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }*/

}

