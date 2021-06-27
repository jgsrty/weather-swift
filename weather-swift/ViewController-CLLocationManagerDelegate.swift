//
//  ViewController-CLLocationManagerDelegate.swift
//  weather-swift
//
//  Created by 荣天阳 on 2021/6/27.
//

import Foundation
import CoreLocation
import Alamofire
import SwiftyJSON

extension ViewController: CLLocationManagerDelegate {
	//获取位置信息成功自动调用
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		let lon  = locations[0].coordinate.longitude
		let lat = locations[0].coordinate.latitude
		AF.request(weatherNowPath, parameters: getParams("\(lon),\(lat)")).responseJSON{ response in
			if let data = response.value {
				let weatherJson = JSON(data)
				self.showWeather(weatherJson)
			}
		}
		AF.request(weatherCityPath, parameters: self.getParams("\(lon),\(lat)")).responseJSON{ response in
			if let data = response.value {
				let weatherJson = JSON(data)
				self.showCity(weatherJson)
			}
		}
	}
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print(error)
		cityLabel.text = "位置信息获取失败"
	}
}
