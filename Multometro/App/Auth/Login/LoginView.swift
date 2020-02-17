//
//  LoginView.swift
//  Multometro
//
//  Created by George Gomes on 07/02/20.
//  Copyright © 2020 CrowCode. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol LoginViewComponents: UIView {
    /// To read UI informations
    var emailObservable: Observable<String> { get }
    var passwordObservable: Observable<String> { get }
    var enterObservable: Observable<Void> { get }
    var didTapRegister: Observable<Void> { get }
    /// To change UI informations
    var enterIsValide: Binder<Bool> { get }
}

class LoginView: UIView, LoginViewComponents {
    //MARK: - Observable Components
    lazy var emailObservable: Observable<String> = {
        return self.fieldsView.emailObservable
    }()

    lazy var passwordObservable: Observable<String> = {
        return self.fieldsView.passwordObservable
    }()

    lazy var enterObservable: Observable<Void> = {
        return self.fieldsView.enterObservable
    }()

    lazy var enterIsValide: Binder<Bool> = {
        return  self.fieldsView.enterIsValide
    }()

    lazy var didTapRegister: Observable<Void>  = {
        return self.registerButton.rx.tap.asObservable()
    }()

    //MARK: - Constants
    private let roundRadius: CGFloat = 8.0

    // MARK: - UIComponets
    private lazy var fieldsView: AuthFormView = {
        let view = AuthFormView(authStep: .login)
        view.backgroundColor = .darkGray
        view.roundedCornerColor(radius: roundRadius)
        return view
    }()

    private lazy var registerButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .darkGray
        return view
    }()

    //MARK: - Initializers
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .black
        self.setupView()
    }

    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

extension LoginView: CodeView {
    //MARK: - UISetup
    func buildViewHierarchy() {
        addSubview(fieldsView)
        addSubview(registerButton)
    }

    func setupConstraints() {
        fieldsView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16).priority(900)
            make.width.lessThanOrEqualTo(400).priority(1000)
            make.center.equalToSuperview()
        }

        registerButton.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(16).priority(900)
            make.width.lessThanOrEqualTo(400).priority(1000)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(20)
        }
    }

    func setupAdditionalConfiguration() {

    }
}
