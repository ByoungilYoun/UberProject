//
//  LocationCell.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/12.
//

import UIKit

class LocationCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "LocationCell"
  
  private let titleLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.text = "123 Main Street"
    label.textColor = .black
    return label
  }()
  
  private let addressLabel : UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14)
    label.textColor = .lightGray
    label.text = "123 Main Street, Washington DC"
    return label
  }()
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - Functions
  private func configureUI() {
    backgroundColor = .white
    selectionStyle = .none
    
    let stack = UIStackView(arrangedSubviews: [titleLabel, addressLabel])
    stack.axis = .vertical
    stack.distribution = .fillEqually
    stack.spacing = 4
    
    addSubview(stack)
    stack.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(12)
    }
  }
}
