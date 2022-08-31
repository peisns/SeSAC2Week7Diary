//
//  BaseView.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/19.
//

import UIKit

class BaseView: UIView {
    
    //코드 베이스
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraints()
    }
    
    // xib, 스토리보드, protocol. 코드베이스여도 쓰긴 해야함
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() { }
    
    func setConstraints() { }
}

// required initializer

protocol example {
    init(name: String)
}

class Mobile: example {
    let name: String
    
    required init(name: String) { //프로토콜에서 온 초기화구문은 required가 앞에 붙음
        self.name = name
    }
}

class Apple: Mobile {
    let wwdc: String
    
    init(wwdc: String){
        self.wwdc = wwdc
        super.init(name: "모바일")//부모클래스 초기화가 나중에 이루어짐, 순서 바뀌면 오류
    }
    
    required init(name: String) {
        fatalError("init(name:) has not been implemented")
    }
}

//let a = Apple(name: "apple")






