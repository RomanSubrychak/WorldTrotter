//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Roman Subrychak on 12/30/17.
//  Copyright © 2017 Roman Subrychak. All rights reserved.
//

import UIKit
import MapKit

class ConversionViewController: UIViewController {
	
	@IBOutlet weak var celsusLabel : UILabel!
	@IBOutlet weak var textField : UITextField!
	
	var fahrenheitValue: Measurement<UnitTemperature>? {
		
		didSet {
			updateCelsusLabel()
		}
	}
	
	var celsusValue: Measurement<UnitTemperature>? {
		if let fahrenheitValue = fahrenheitValue {
			return fahrenheitValue.converted(to: .celsius)
		} else {
			return nil
		}
	}
	
	let numberFormatter: NumberFormatter = {
		let numberFormatter = NumberFormatter()
		numberFormatter.numberStyle = .decimal
		numberFormatter.minimumFractionDigits = 0
		numberFormatter.maximumFractionDigits = 1
		return numberFormatter
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		updateCelsusLabel()
	}
	
	override func viewWillAppear(_ animated: Bool) {

	}
	
	@IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
		
		if let text = textField.text, let value = Double(text) {
			fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
		} else {
			fahrenheitValue = nil
		}
	}
	
	@IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
		textField.resignFirstResponder()
	}
	
	func updateCelsusLabel() {
		if let celsusValue = celsusValue {
			celsusLabel.text = numberFormatter.string(from: NSNumber(value: celsusValue.value))
		} else {
			celsusLabel.text = "???"
		}
	}
}

extension ConversionViewController: UITextFieldDelegate {
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
		let replacementTextHasDecimalSepartor = string.range(of: ".")
		let replacementTextHasLetters = string.rangeOfCharacter(from: .letters)
		
		if (existingTextHasDecimalSeparator != nil &&
			replacementTextHasDecimalSepartor != nil) ||
			replacementTextHasLetters != nil {

			return false

		} else {
			return true
		}
		
	}
}
