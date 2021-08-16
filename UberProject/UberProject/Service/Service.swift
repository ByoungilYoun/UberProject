//
//  Service.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/17.
//

import Firebase

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")

struct Service {
  
  static let shared = Service()
  
//  let currentUid = Auth.auth().currentUser?.uid
  
  func fetchUserData(completion : @escaping(String) -> Void) {
    guard let currentUid = Auth.auth().currentUser?.uid else {return}
    
    REF_USERS.child(currentUid).observeSingleEvent(of: .value) { snapshot in
      guard let dictionary = snapshot.value as? [String:Any] else {return}
      guard let fullname = dictionary["fullname"] as? String else {return}
      completion(fullname)
    }
  }
}
