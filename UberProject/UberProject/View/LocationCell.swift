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
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
