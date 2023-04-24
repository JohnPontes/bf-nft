//
//  Alert.swift
//  AppBackFront
//
//  Created by John Pontes on 23/04/23.
//

import UIKit

class AlertController {
    var controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(title: String, message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel) { share in
            completion?()
        }
        
        alertController.addAction(ok)
        self.controller.present(alertController, animated: true)
        
    }
}
