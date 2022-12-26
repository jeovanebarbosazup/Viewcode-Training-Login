//
//  UIAlertController.swift
//  ex 4.4 Viewcode
//
//  Created by jeovane.barbosa on 22/12/22.
//

import Foundation
import UIKit

extension UIAlertController {
    
    static func showAlert(withTitle title: String, andMessage message: String, atController vc: UIViewController ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        
        vc.present(alert, animated: true)
    }
}
