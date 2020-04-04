//
//  Helper.swift
//  DiscountBankExam
//
//  Created by Roei Baruch on 04/04/2020.
//  Copyright © 2020 Roei Baruch. All rights reserved.
//

import Foundation
import UIKit

struct Alerts {
  static func showAlert(vc: UIViewController, action: UIAlertAction) {
        let alert = UIAlertController(title: "Ooops!", message: "Somthing went wrong", preferredStyle: .alert)
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
}
