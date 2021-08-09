//
//  LocationInputActivationView.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/09.
//

import UIKit

protocol LocationInputActivationViewDelegate : AnyObject {
  func presentLocationInputView()
}

class LocationInputActivationView : UIView {
  
  //MARK: - Properties
  weak var delegate : LocationInputActivationViewDelegate?
  
  private let indicatorView : UIView = {
    let view = UIView()
    view.backgroundColor = .black
    return view
  }()
  
  private let placeholderLabel : UILabel = {
    let label = UILabel()
    label.text = "Where to?"
    label.font = UIFont.systemFont(ofSize: 18)
    label.textColor = .darkGray
    return label
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
    addTapGesture()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Function
  private func configureUI() {
    backgroundColor = .white
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.55
    layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
    layer.masksToBounds = false
    
    [indicatorView, placeholderLabel].forEach {
      addSubview($0)
    }
    
    indicatorView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(6)
    }
    
    placeholderLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalTo(indicatorView.snp.trailing).offset(20)
    }
  }
  
  private func addTapGesture() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(presentLocationInputView))
    addGestureRecognizer(tap)
  }
  
  //MARK: - @objc func
  @objc func presentLocationInputView() {
    delegate?.presentLocationInputView()
  }
}
