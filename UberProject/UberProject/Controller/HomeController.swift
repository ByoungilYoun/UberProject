//
//  HomeController.swift
//  UberProject
//
//  Created by 윤병일 on 2021/08/07.
//

import UIKit
import Firebase
import MapKit

class HomeController : UIViewController {
  
  //MARK: - Properties
  
  private let mapView = MKMapView()
  private let locationManager = CLLocationManager()
  
  private let inputActivationView = LocationInputActivationView()
  private let locationInputView = LocationInputView()
  private let tableView = UITableView()
  
  private final let locationInputViewHeight : CGFloat = 200
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    checkIfUserIsLoggedIn()
    enableLocationServices()
    fetchUserData()
//    signOut()
  }
  
  //MARK: - Functions
  func configureUI() {
    configureMapView()
    
    view.addSubview(inputActivationView)
    inputActivationView.snp.makeConstraints {
      $0.centerX.equalToSuperview()
      $0.height.equalTo(50)
      $0.width.equalTo(view.frame.width - 64)
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(32)
    }
    inputActivationView.alpha = 0
    inputActivationView.delegate = self
    
    UIView.animate(withDuration: 2) {
      self.inputActivationView.alpha = 1
    }
    
    configureTableView()
  }
  
  func configureMapView() {
    view.addSubview(mapView)
    mapView.frame = view.frame
    
    mapView.showsUserLocation = true // 사용자의 위치로 간다.
    mapView.userTrackingMode = .follow
  }
  
  func checkIfUserIsLoggedIn() {
    if Auth.auth().currentUser?.uid == nil {
      DispatchQueue.main.async {
        let nav = UINavigationController(rootViewController: LoginController())
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
      }
    } else {
      configureUI()
    }
  }
  
 
  func signOut() {
    do {
      try Auth.auth().signOut()
    } catch {
      print("Debug : error signing out ")
    }
  }
  
  func configureLocationInputView() {
    view.addSubview(locationInputView)
    locationInputView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(locationInputViewHeight)
    }
    
    locationInputView.alpha = 0
    locationInputView.delegate = self
    
    UIView.animate(withDuration: 0.5, animations: {
      self.locationInputView.alpha = 1
    }) { _ in
      UIView.animate(withDuration: 0.3, animations: {
        self.tableView.frame.origin.y = self.locationInputViewHeight
      })
    }
  }
  
  func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(LocationCell.self, forCellReuseIdentifier: LocationCell.identifier)
    tableView.rowHeight = 60
    tableView.backgroundColor = .white
    tableView.tableFooterView = UIView()
    
    let height = view.frame.height - locationInputViewHeight
    tableView.frame = CGRect(x: 0, y: view.frame.height, width: view.frame.width, height: height)
    view.addSubview(tableView)
   
  }
  
  //MARK: - API
  func fetchUserData() {
    Service.shared.fetchUserData()
  }
}

  //MARK: - LocationServices
extension HomeController : CLLocationManagerDelegate {
  func enableLocationServices() {
    locationManager.delegate = self
    
    switch locationManager.authorizationStatus {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization() // 이걸 먼저 해야한다
      print("Debug : not determined")
    case .restricted , .denied:
      break
    case .authorizedAlways :
      print("Debug : auth always")
      locationManager.startUpdatingLocation()
      locationManager.desiredAccuracy = kCLLocationAccuracyBest
    case .authorizedWhenInUse :
      print("Debug : auth when in use")
      locationManager.requestAlwaysAuthorization()
    default:
      break
    }
  }

  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    if manager.authorizationStatus == .authorizedWhenInUse {
      locationManager.requestAlwaysAuthorization() // 한번 사용 허락을 누르면 그다음 바로 계속 허락을 할꺼냐는 request를 보낸다.
    }
  }
}

  //MARK: - LocationInputActivationViewDelegate
extension HomeController : LocationInputActivationViewDelegate {
  func presentLocationInputView() {
    inputActivationView.alpha = 0
    configureLocationInputView()
  }
}

  //MARK: - LocationInputViewDelegate
extension HomeController : LocationInputViewDelegate {
  func dismissLocationInputView() {

    UIView.animate(withDuration: 0.3, animations: {
      self.locationInputView.alpha = 0
      self.tableView.frame.origin.y = self.view.frame.height
    }) { _ in
      self.locationInputView.removeFromSuperview()
      UIView.animate(withDuration: 0.3) {
        self.inputActivationView.alpha = 1
      }
    }
  }
}

  //MARK: - UITableViewDelegate, UITableViewDataSource
extension HomeController : UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Test"
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return section == 0 ? 2 : 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: LocationCell.identifier, for: indexPath) as! LocationCell
    return cell
  }
}
