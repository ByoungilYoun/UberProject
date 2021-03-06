//
//  AuthButton.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/02.
//

import UIKit

class AuthButton : UIButton {
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setTitleColor(UIColor(white: 1, alpha: 0.5), for: .normal)
    backgroundColor = .mainBlueTint
    layer.cornerRadius = 5
    
    snp.makeConstraints {
      $0.height.equalTo(50)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
