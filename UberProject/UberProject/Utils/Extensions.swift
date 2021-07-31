//
//  Extensions.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/01.
//

import UIKit

  //MARK: - extension UIView
extension UIView  {
  func inputContainerView(image : UIImage, textField : UITextField) -> UIView {
    let view = UIView()
    
    let imageView = UIImageView()
    imageView.image = image 
    imageView.alpha = 0.87
    view.addSubview(imageView)
    
    imageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(8)
      $0.width.height.equalTo(24)
    }
    
    view.addSubview(textField)
    textField.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(8)
      $0.centerY.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-8)
      $0.trailing.equalToSuperview()
    }
    
    let seperatorView = UIView()
    seperatorView.backgroundColor = .lightGray
    view.addSubview(seperatorView)
    seperatorView.snp.makeConstraints {
      $0.leading.equalTo(imageView)
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.height.equalTo(0.75)
    }
    
    return view
  }
}

  //MARK: - extension UITextField
extension UITextField {
  func textField(withPlaceholder placeholder : String, isSecureTextEntry : Bool) -> UITextField {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.isSecureTextEntry = isSecureTextEntry
    tf.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.lightGray])
    return tf
  }
}
