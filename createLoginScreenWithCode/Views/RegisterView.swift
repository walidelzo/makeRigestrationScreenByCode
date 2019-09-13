//
//  RegisterView.swift
//  createLoginScreenWithCode
//
//  Created by Admin on 9/10/19.
//  Copyright © 2019 NanoSoft. All rights reserved.
//

import UIKit
@objc protocol RegistrationViewDelegate :class {
    @objc  func imageViewTaped()
    @objc  func registerButtonTaped(userName:String , passWord:String)
}
class RegisterView: UIView {
    
   
    
     init(delegate: RegistrationViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        layOut()
    }
    
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layOut(){
        addSubViews()
        addConstraint()
    }
    
    private func addSubViews(){
        self.addSubview(scrollView)
        scrollView.addSubview(contianerView)
        contianerView.addSubview(welcomeLabel)
        contianerView.addSubview(profileImage)
        contianerView.addSubview(userNameText)
        contianerView.addSubview(passWordTextField)
        contianerView.addSubview(registerButton)
    }
    
    private func addConstraint(){
        setUpScrollViewConstraint()
        setUpContainerConstraint()
        setUpWelcomeLabelConstraint()
        setupProfileImageConstraint()
        setUpuUserNameConstraint()
        setUpPasswordConstraint()
        setUpregisterButtonConstraint()
        
    }
    
    weak var delegate : RegistrationViewDelegate!
    
    private lazy var welcomeLabel:UILabel = {
        let label = UILabel()
        label.text = "Welecome to registration Form "
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //Scrollview ByCode
    
    private lazy var scrollView:UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    private lazy var contianerView:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var profileImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 50
        image.backgroundColor = .black
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(profileImageTapGesture)
        return image
    }()
    
    private lazy var profileImageTapGesture:UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer()
        gesture.addTarget(self, action: #selector(delegate.imageViewTaped))
        return gesture
    }()
    
    //username textField
    
    private  lazy var userNameText:UITextField = {
        let textField = UITextField()
        textField.placeholder = "user name"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .lightGray
        textField.tintColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //password textField
    
    private lazy var passWordTextField :UITextField = {
        let textField = UITextField()
        textField.placeholder = "********"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 20)
        textField.backgroundColor = .lightGray
        textField.tintColor = .red
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    // button Register
    private  lazy var registerButton:UIButton = {
        
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("login", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(registrationUserAndPassword), for:.touchUpInside )
        return button
    }()
    
    
    
    
    private func setUpWelcomeLabelConstraint(){
        
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 10)
            ])
    }
    
    private func setUpScrollViewConstraint(){
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo:safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    private func setUpContainerConstraint(){
        NSLayoutConstraint.activate([
            contianerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor,constant: 30),
            contianerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contianerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contianerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contianerView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ])
        
    }
    
    private func setupProfileImageConstraint(){
        NSLayoutConstraint.activate([
            profileImage.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),
            profileImage.centerXAnchor.constraint(equalTo: contianerView.centerXAnchor, constant:0),
            profileImage.widthAnchor.constraint(equalToConstant: 100),
            profileImage.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
    
    private func setUpuUserNameConstraint(){
        NSLayoutConstraint.activate([
            userNameText.topAnchor.constraint(equalTo: profileImage.bottomAnchor ,constant: 20),
            userNameText.leadingAnchor.constraint(equalTo: contianerView.leadingAnchor,constant: 10),
            userNameText.trailingAnchor.constraint(equalTo: contianerView.trailingAnchor , constant: -10),
            userNameText.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }
    
    private func setUpPasswordConstraint(){
        NSLayoutConstraint.activate([
            passWordTextField.topAnchor.constraint(equalTo: userNameText.bottomAnchor, constant: 10),
            passWordTextField.leadingAnchor.constraint(equalTo: contianerView.leadingAnchor, constant: 10),
            passWordTextField.trailingAnchor.constraint(equalTo: contianerView.trailingAnchor, constant: -10),
            passWordTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    private func setUpregisterButtonConstraint(){
        NSLayoutConstraint.activate([
            registerButton.topAnchor.constraint(equalTo: passWordTextField.bottomAnchor, constant: 20),
            registerButton.centerXAnchor.constraint(equalTo: contianerView.centerXAnchor, constant: 0),
            registerButton.widthAnchor.constraint(equalTo: contianerView.widthAnchor , constant: -(UIScreen.main.bounds.width * 0.75))
            ])
    }
    
   @objc  func registrationUserAndPassword(){
        delegate.registerButtonTaped(userName: userNameText.text!, passWord: passWordTextField.text!)
    }
    
    
    
}
