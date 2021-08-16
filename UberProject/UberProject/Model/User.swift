//
//  User.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/17.
//


struct User {
  let fullname : String
  let email : String
  let accountType : Int
  
  init(dictionary : [String : Any]) {
    self.fullname = dictionary["fullname"] as? String ?? ""
    self.email = dictionary["email"] as? String ?? ""
    self.accountType = dictionary["accountType"] as? Int ?? 0
  }
}
