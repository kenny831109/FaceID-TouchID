//
//  ViewController.swift
//  FaceID&TouchID
//
//  Created by 逸唐陳 on 2019/1/30.
//  Copyright © 2019 逸唐陳. All rights reserved.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    let authenticationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("TouchID/FaceID", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
    }
    
    fileprivate func setupButton() {
        view.addSubview(authenticationButton)
        authenticationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        authenticationButton.widthAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        authenticationButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        authenticationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        authenticationButton.addTarget(self, action: #selector(authenticationHandler), for: .touchUpInside)
    }

}

extension ViewController {
    
    @objc func authenticationHandler() {
        let context = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message") { (success, err) in
                if success {
                    print("Good")
                }else {
                    print(err!)
                }
            }
        }
    }
    
}

