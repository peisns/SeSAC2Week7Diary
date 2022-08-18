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
    }
    
    @objc func nameButtonClicked() {
        
        let vc = ProfileViewController()
        
        vc.saveButtonActionHandler = {
            self.nameButton.setTitle(vc.nameTextField.text, for: .normal)
        }
        
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

