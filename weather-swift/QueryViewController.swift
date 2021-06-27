//
//  QueryViewController.swift
//  weather-swift
//
//  Created by 荣天阳 on 2021/6/27.
//

import UIKit

protocol QueryViewControllerDelegate {
	func didChangeCity(city: String)
}

class QueryViewController: UIViewController {
	
	var currentCity = ""
	var delegate: QueryViewControllerDelegate?
	
	@IBOutlet weak var currentCityLabel: UILabel!
	@IBOutlet weak var cityTextField: UITextField!
	override func viewDidLoad() {
		super.viewDidLoad()
		cityTextField.becomeFirstResponder()
		//cityTextField.resignFirstResponder()
		currentCityLabel.text = currentCity
	}
	
	@IBAction func back(_ sender: Any) {dismiss(animated: true)}
	
	@IBAction func query(_ sender: Any) {
		dismiss(animated: true)
		//验证空值 空格
		if !cityTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
			delegate?.didChangeCity(city: cityTextField.text!)
		}
	}
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
	// Get the new view controller using segue.destination.
	// Pass the selected object to the new view controller.
	}
	*/
	
}
