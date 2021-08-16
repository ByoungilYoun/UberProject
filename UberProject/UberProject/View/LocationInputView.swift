//
//  LocationInputView.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/10.
//

import UIKit

protocol LocationInputViewDelegate : AnyObject {
  func dismissLocationInputView()
}

class LocationInputView : UIView {
  
  //MARK: - Properties
  
  var user : User? {
    didSet {
      titleLabel.text = user?.fullname
    }
  }
  
  weak var delegate : LocationInputViewDelegate?
  
  private let backButton : UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
    return button
  }()
  
  private let titleLabel : UILabel = {
    let label = UILabel()
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 16)
    return label
  }()
  
  private let startLocationIndicatorView : UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  private let linkingView : UIView = {
    let view = UIView()
    view.backgroundColor = .darkGray
    return view
  }()
  
  private let destinationIndicatorView : UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()
  
  private lazy var startingLocationTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Current Location"
    tf.backgroundColor = .gray
    tf.isEnabled = false
    tf.font = UIFont.systemFont(ofSize: 14)
    
    let paddingView = UIView()
    paddingView.snp.makeConstraints {
      $0.height.equalTo(30)
      $0.width.equalTo(8)
    }
    tf.leftView = paddingView
    tf.leftViewMode = .always
    return tf
  }()
  
  private lazy var destinationLocationTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Enter a destination"
    tf.backgroundColor = .lightGray
    tf.returnKeyType = .search
    tf.font = UIFont.systemFont(ofSize: 14)
    
    let paddingView = UIView()
    paddingView.snp.makeConstraints {
      $0.height.equalTo(30)
      $0.width.equalTo(8)
    }
    tf.leftView = paddingView
    tf.leftViewMode = .always
    return tf
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Functions
  private func configureUI() {
    addShadow()
    backgroundColor = .white
    
    [backButton, titleLabel, startingLocationTextField, destinationLocationTextField, startLocationIndicatorView, destinationIndicatorView, linkingView].forEach {
      addSubview($0)
    }
    
    backButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(44)
      $0.leading.equalToSuperview().offset(12)
      $0.width.equalTo(24)
      $0.height.equalTo(25)
    }
    
    titleLabel.snp.makeConstraints {
      $0.centerY.equalTo(backButton)
      $0.centerX.equalTo(self)
    }
    
    startingLocationTextField.snp.makeConstraints {
      $0.top.equalTo(backButton.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(40)
      $0.trailing.equalToSuperview().offset(-40)
      $0.height.equalTo(30)
    }
    
    destinationLocationTextField.snp.makeConstraints {
      $0.top.equalTo(startingLocationTextField.snp.bottom).offset(12)
      $0.leading.equalToSuperview().offset(40)
      $0.trailing.equalToSuperview().offset(-40)
      $0.height.equalTo(30)
    }
    
    startLocationIndicatorView.snp.makeConstraints {
      $0.centerY.equalTo(startingLocationTextField)
      $0.leading.equalToSuperview().offset(20)
      $0.width.height.equalTo(6)
    }
    
    startLocationIndicatorView.layer.cornerRadius = 6 / 2
    
    destinationIndicatorView.snp.makeConstraints {
      $0.centerY.equalTo(destinationLocationTextField)
      $0.leading.equalToSuperview().offset(20)
      $0.width.height.equalTo(6)
    }
    
    linkingView.snp.makeConstraints {
      $0.centerX.equalTo(startLocationIndicatorView)
      $0.top.equalTo(startLocationIndicatorView.snp.bottom).offset(4)
      $0.bottom.equalTo(destinationIndicatorView.snp.top).offset(-4)
      $0.width.equalTo(0.5)
    }
    
  }
  //MARK: - objc func
  @objc func handleBackTapped() {
    delegate?.dismissLocationInputView()
  }
}
