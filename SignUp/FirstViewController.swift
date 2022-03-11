//
//  FirstViewController.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var signUpID: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.signUpID.text = UserInformation.shared.userID
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
