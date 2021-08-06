//
//  HomeController.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/07.
//

import UIKit
import Firebase

class HomeController : UIViewController {
  
  //MARK: - Properties
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    checkIfUserIsLoggedIn()
    view.backgroundColor = .blue
  }
  
  //MARK: - Functions
  func checkIfUserIsLoggedIn() {
    if Auth.auth().currentUser?.uid == nil {
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
      }
    } else {
      print("Debug : User id is \(Auth.auth().currentUser?.uid)")
    }
  }
  
 
  func signOut() {
    do {
      try Auth.auth().signOut()
    } catch {
      print("Debug : error signing out ")
    }
  }
}
