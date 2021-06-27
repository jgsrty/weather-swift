//
//  ViewController-Helper.swift
//  weather-swift
//
//  Created by 荣天阳 on 2021/6/27.
//

import Foundation
import SwiftyJSON

extension ViewController {
	func showWeather(_ weatherJson: JSON){
		weather.temp = "\(weatherJson["now","temp"].stringValue)˚"
		weather.icon = weatherJson["now","icon"].stringValue
		//				self.weather
		tempLabel.text = weather.temp
		iconImage.image = UIImage(named: weather.icon)
	}
	func showCity(_ cityJson: JSON) {
		weather.city = cityJson["location",0,"name"].stringValue
		cityLabel.text = weather.city
	}
	func getParams(_ location: String) -> [String: String] {
		["location": location, "key": weatherWebKey]
	}
}
