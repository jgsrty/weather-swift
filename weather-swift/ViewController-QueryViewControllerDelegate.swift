//
//  ViewController-QueryViewControllerDelegate.swift
//  weather-swift
//
//  Created by 荣天阳 on 2021/6/27.
//

import Foundation
import Alamofire
import SwiftyJSON

extension ViewController: QueryViewControllerDelegate {
	func didChangeCity(city: String) {
		AF.request(weatherCityPath, parameters: getParams(city)).responseJSON{ response in
			if let data = response.value {
				let weatherJson = JSON(data)
				self.showCity(weatherJson)
			
				let cityId = weatherJson["location",0,"id"].stringValue
				AF.request(weatherNowPath, parameters: self.getParams(cityId)).responseJSON{ response in
					if let data = response.value {
						let weatherJson = JSON(data)
						self.showWeather(weatherJson)
					}
				}
			}
		}
	}
}
