//
//  ViewController.swift
//  ex 4.4 Viewcode
//
//  Created by jeovane.barbosa on 21/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    typealias ValidationMessage = String
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        view.backgroundColor = .systemBackground

        
        return view
    }()
    
    lazy var containerStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.spacing = 32
        stackview.backgroundColor = .clear
        stackview.isLayoutMarginsRelativeArrangement = true
        stackview.layoutMargins = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)

        
        return stackview
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN COM SUA CONTA"
        label.tintColor = .darkGray
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textAlignment = .center
        
        return label
    }()
    
    lazy var inputsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.spacing = 16
        
        return stackview
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.textColor = .secondaryLabel
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.textContentType = .emailAddress
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        textField.backgroundColor = .secondarySystemBackground
        
        return textField
    }()
    
    lazy var senhaTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.textColor = .secondaryLabel
        textField.font = .systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.textContentType = .password
        textField.isSecureTextEntry = true
        textField.backgroundColor = .secondarySystemBackground
        
        return textField
    }()
    
    lazy var buttonsStackView: UIStackView = {
        let stackview = UIStackView()
        stackview.axis = .vertical
        stackview.alignment = .fill
        stackview.distribution = .fill
        stackview.spacing = 16
        
        return stackview
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        button.backgroundColor = .blueMangueritte
        button.setTitle("LOGIN", for: .normal)
        button.setTitleColor(.secondarySystemBackground, for: .normal)
        button.addTarget(self, action: #selector(loginButtonPressed(sendoer: )), for: .touchUpInside)
        return button
    }()
    
    lazy var passwordRecoveryButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.addTarget(self, action: #selector(passwordRecoveryButtonPressed(sender:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction func loginButtonPressed(sendoer: UIButton!) {
        switch isFormValid() {
            
        case (false, let message):
            UIAlertController.showAlert(withTitle: "Error", andMessage: message, atController: self)
            
        case (true, let message):
            UIAlertController.showAlert(withTitle: "Logando..", andMessage: message, atController: self)
        }
    }
    
    @IBAction func passwordRecoveryButtonPressed(sender: UIButton!){
        switch checkEmail() {
            
        case (false, let message):
            UIAlertController.showAlert(withTitle: "Error", andMessage: message, atController: self)
            
        case (true, let message):
            UIAlertController.showAlert(withTitle: "Redefinir senha", andMessage: message, atController: self)
        }
    }
    
    private func isFormValid() -> (Bool, ValidationMessage) {
        if let email = emailTextField.text, email.isEmpty {
            return (false, "Por favor, preencha com o seu email.")
        }
        
        if let senha = senhaTextField.text, senha.isEmpty {
            return (false, "Por favor, preencha o campo da senha.")
        }
        
        return (true, "Login efetuado com sucesso!")
    }
    
    private func checkEmail() -> (Bool, ValidationMessage) {
        guard let email = emailTextField.text, !email.isEmpty else{
            return (false, "Por favor, preencha o campo com seu email.")
        }
        
        return (true, "Enviamos um email para: \(email). Siga a instruções para criar uma nova senha.")
    }
}

//MARK: Viewcode Protocol Implementation
extension LoginViewController: Viewcode {
    func buildHierarchy() {
        view.addSubview(containerView)
        containerView.addSubview(containerStackView)
        containerStackView.addArrangedSubview(titleLabel)
        containerStackView.addArrangedSubview(inputsStackView)
        inputsStackView.addArrangedSubview(emailTextField)
        inputsStackView.addArrangedSubview(senhaTextField)
        containerStackView.addArrangedSubview(buttonsStackView)
        buttonsStackView.addArrangedSubview(loginButton)
        buttonsStackView.addArrangedSubview(passwordRecoveryButton)
    }
    
    func setupConstraints() {
        
        //containerView Constraints
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
        ])
        
        //containerStackView Constraints
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
        
        //emailTextField Contraints
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        //senhaTextField Constraints
        NSLayoutConstraint.activate([
            senhaTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
        
        //loginButton Constriants
        NSLayoutConstraint.activate([
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
        
        
    }
    
    func applyAdditionalChanges() {
        view.backgroundColor = .blueMangueritte
    }
    
    
}
