//
//  BaseViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/19.
//

import UIKit

class BaseViewController: UIViewController {
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        configure()
        setConstraints()
        
    }
    
    
    func configure() {
        
    }
    
    func setConstraints() {
        
    }
    
    func showAlertMessage(title:String, message:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .destructive)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(ok)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
}
