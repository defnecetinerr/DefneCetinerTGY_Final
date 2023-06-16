//
//  BaseViewController.swift
//  iTunesProject
//
//  Created by Defne Çetiner on 7.06.2023.
//

import UIKit

class BaseViewController: UIViewController, LoadingShowable {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlertForInternet(_ title: String?, _ message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
