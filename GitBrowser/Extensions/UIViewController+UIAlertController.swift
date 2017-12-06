//
//  UIViewController + UIAlertController.swift
//  GitBrowser
//
//  Created by Станислав Калиберов on 04.12.2017.
//  Copyright © 2017 Станислав Калиберов. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showOkAlert(title: String?, text: String?) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
