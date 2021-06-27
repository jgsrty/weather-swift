//
//  ViewController.swift
//  weather-swift
//
//  Created by 荣天阳 on 2021/6/27.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
	
	@IBOutlet weak var tempLabel: UILabel!
	@IBOutlet weak var iconImage: UIImageView!
	@IBOutlet weak var cityLabel: UILabel!
	
	let locationManager = CLLocationManager()
	let weather = Weather()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//请求授权获取位置
		locationManager.requestWhenInUseAuthorization()
		//获取位置的精度
		locationManager.delegate = self
		locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
		locationManager.requestLocation()
	}
	
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destination.
		// Pass the selected object to the new view controller.
		
//		if segue.identifier == "QueryViewControllerSegue" {
//			let vc = segue.destination as! QueryViewController
//			vc.currentCity = weather.city
//		}
		if let vc = segue.destination as? QueryViewController {
			vc.currentCity = weather.city
			vc.delegate = self
		}
	}
	
	
}

