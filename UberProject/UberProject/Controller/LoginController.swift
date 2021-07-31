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
  
  private lazy var emailContainerView : UIView = {
    let view = UIView()

    let imageView = UIImageView()
    imageView.image = #imageLiteral(resourceName: "ic_mail_outline_white_2x")
    imageView.alpha = 0.87
    view.addSubview(imageView)
    
    imageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(8)
      $0.width.height.equalTo(24)
    }
    
    view.addSubview(emailTextField)
    emailTextField.snp.makeConstraints {
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
  }()
  
  private let emailTextField : UITextField = {
    let tf = UITextField()
    tf.borderStyle = .none
    tf.font = UIFont.systemFont(ofSize: 16)
    tf.textColor = .white
    tf.keyboardAppearance = .dark
    tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor : UIColor.lightGray])
    return tf
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
    
    [titleLabel, emailContainerView].forEach {
      view.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.centerX.equalToSuperview()
    }
    
    emailContainerView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.height.equalTo(50)
    }
  }
}
