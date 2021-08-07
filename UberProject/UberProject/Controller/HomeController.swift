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
  
  //MARK: - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    checkIfUserIsLoggedIn()
    enableLocationServices()
//    signOut()
  }
  
  //MARK: - Functions
  func configureUI() {
    view.addSubview(mapView)
    mapView.frame = view.frame
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
