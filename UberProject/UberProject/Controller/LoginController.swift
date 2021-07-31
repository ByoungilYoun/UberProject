//
//  LoginController.swift
//  UberProject
//
//  Created by 윤병일 on 2021/07/31.
//

import UIKit

class LoginController : UIViewController {
  
  //MARK: - Properties
  
  private let titleLabel : UILabel = {
    let label = UILabel()
    label.text = "UBER"
    label.font = UIFont(name: "Avenir-Light", size: 36)
    label.textColor = UIColor(white: 1, alpha: 0.8)
    return label
  }()
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  
  //MARK: - Functions
  private func configureUI() {
    view.backgroundColor = UIColor(red: 25 / 255, green: 25 / 255, blue: 25 / 255, alpha: 1)
    
    [titleLabel].forEach {
      view.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.centerX.equalToSuperview()
    }
  }
}
