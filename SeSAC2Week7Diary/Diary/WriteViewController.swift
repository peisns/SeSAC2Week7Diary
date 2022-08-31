//
//  WriteViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/19.
//

import UIKit

//BaseViewController가 UIKIT 상속 받기 때문에 사용할 수 있음
class WriteViewController: BaseViewController {
    
    let mainView = WriteView()
    
    override func loadView() { // super.loadView X
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        mainView.titleTextField.addTarget(self, action: #selector(titleTextFieldClicked(_:)), for: .editingDidEndOnExit)
    }
    
    @objc func titleTextFieldClicked(_ textField: UITextField) {
        guard let text = textField.text, text.count > 0 else {
            showAlertMessage(title: "제목을 입력해주세요", message: "필요합니다")
            return
        }
    }
    
    
    override func setConstraints() {
        
    }
}
