//
//  UserInformation.swift
//  SignUp
//
//  Created by 이범준 on 2022/02/27.
//

import Foundation

//singleton pattern 구현
class UserInformation {
    static let shared: UserInformation = UserInformation()
    
    var userID: String?
    var userPassword: String?
    var selfIntroduce: String?
    var userPhoneNumber: String?
    var userBirthDate: String?
}
