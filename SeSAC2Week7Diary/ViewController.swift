//
//  ViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/16.
//

import UIKit

import SnapKit

import SeSAC2UIFramework

class ViewController: UIViewController {
    
    let nameButton: UIButton = {
       let view = UIButton()
        view.setTitle("닉네임", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = .black
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        nameButton.addTarget(self, action: #selector(nameButtonClicked), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(saveButtonNotificationObserver(notification:)), name: NSNotification.Name("saveButtonNotification"), object: nil)
    }
    
    @objc func saveButtonNotificationObserver(notification: NSNotification) {
        if let name = notification.userInfo?["name"] as? String {
            print(name)
            self.nameButton.setTitle(name, for: .normal)
        }
    }
    
    @objc func nameButtonClicked() {
//        let vc = WriteViewController()
//        present(vc, animated: true)
        let vc = ProfileViewController()

        vc.saveButtonActionHandler = { name in
            self.nameButton.setTitle(name, for: .normal)
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("TEST"), object: nil, userInfo: ["name": "\(Int.random(in: 1...100))", "value": 123456])

        present(vc, animated: true)
        
    }

    
    func configureUI() {
        view.addSubview(nameButton)
        
        nameButton.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.center.equalTo(view)
        }
        
    }
    
}

