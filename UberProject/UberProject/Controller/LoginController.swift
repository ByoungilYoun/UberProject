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
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    return view
  }()
  
  private lazy var passwordContainerView : UIView = {
    let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
    view.snp.makeConstraints {
      $0.height.equalTo(50)
    }
    return view
  }()
  
  private let emailTextField : UITextField = {
    return UITextField().textField(withPlaceholder: "Email", isSecureTextEntry: false)
  }()
  
  private let passwordTextField : UITextField = {
    return UITextField().textField(withPlaceholder: "Password", isSecureTextEntry: true)
  }()
  
  private let loginButton : AuthButton = {
    let button = AuthButton(type: .system)
    button.setTitle("Log In", for: .normal)
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    return button
  }()
  
  let dontHaveAccountButton : UIButton = {
    let button = UIButton(type: .system)
    let attributedTitle = NSMutableAttributedString(string: "Don't have an account?", attributes: [.font : UIFont.systemFont(ofSize: 16), .foregroundColor : UIColor.lightGray])
    attributedTitle.append(NSAttributedString(string: " Sign Up", attributes: [.font : UIFont.boldSystemFont(ofSize: 16), .foregroundColor : UIColor.mainBlueTint]))
    button.setAttributedTitle(attributedTitle, for: .normal)
    button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
    return button
  }()
  
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
    configureNavigationBar()
  }
  
  //MARK: - Functions
  private func configureUI() {
    view.backgroundColor = .backgroundColor
    
    let stack = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 24
    
    [titleLabel, stack, dontHaveAccountButton].forEach {
      view.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.centerX.equalToSuperview()
    }
    
    stack.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
    }
    
    dontHaveAccountButton.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      $0.height.equalTo(32)
    }
  }

  private func configureNavigationBar() {
    navigationController?.navigationBar.isHidden = true
    navigationController?.navigationBar.barStyle = .black
  }
  
  //MARK: - @objc func
  @objc func handleShowSignUp() {
    let controller = SignUpController()
    navigationController?.pushViewController(controller, animated: true)
  }
}
