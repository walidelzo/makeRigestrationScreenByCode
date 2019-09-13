//
//  ViewController.swift
//  createLoginScreenWithCode
//
//  Created by Admin on 9/9/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,RegistrationViewDelegate{
  

    
    //main view
    lazy var mainView : RegisterView = {
        let view = RegisterView(delegate: self)
        view.backgroundColor = .white
        return view
    }()
    
    //viewController functions
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.delegate = self 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     }
    
    func imageViewTaped() {
        print("the imageView Taped ...")
    }
    
    func registerButtonTaped(userName: String, passWord: String) {
        print(userName)
        print(passWord)
    }
}

