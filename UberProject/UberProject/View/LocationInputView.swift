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
  
  weak var delegate : LocationInputViewDelegate?
  
  private let backButton : UIButton = {
    let button = UIButton(type: .system)
    button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_black_36dp").withRenderingMode(.alwaysOriginal), for: .normal)
    button.addTarget(self, action: #selector(handleBackTapped), for: .touchUpInside)
    return button
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
    
    [backButton].forEach {
      addSubview($0)
    }
    
    backButton.snp.makeConstraints {
      $0.top.equalToSuperview().offset(44)
      $0.leading.equalToSuperview().offset(12)
      $0.width.equalTo(24)
      $0.height.equalTo(25)
    }
  }
  //MARK: - objc func
  @objc func handleBackTapped() {
    delegate?.dismissLocationInputView()
  }
}
