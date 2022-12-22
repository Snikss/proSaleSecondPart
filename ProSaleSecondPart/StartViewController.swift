//
//  ViewController.swift
//  ProSaleSecondPart
//
//  Created by Nikolai Salmin on 22.12.2022.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    
    private let user: User
    
    init(user: User) {
        self.user = user
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        let firstButton = UIButton()
        firstButton.setTitle("Timur way", for: .normal)
        firstButton.backgroundColor = .red
        firstButton.addTarget(self, action: #selector(didTapFirstButton), for: .touchUpInside)
     
        let secondButton = UIButton()
        secondButton.setTitle("Nikolai way", for: .normal)
        secondButton.backgroundColor = .green
        secondButton.addTarget(self, action: #selector(didTapSecondButton), for: .touchUpInside)
        
        [firstButton, secondButton].forEach(view.addSubview)
        
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.snp.makeConstraints { make in
            make.top.equalTo(firstButton.snp.bottom).offset(50)
            make.leading.equalTo(firstButton)
            make.width.height.equalTo(150)
        }
        
        switch user {
        case .timur:
            navigationController?.pushViewController(TimurFirstVC(), animated: false)
        case .nikolai:
            navigationController?.pushViewController(NikolaiFirstVC(), animated: false)
        }
    }
    
    @objc private func didTapFirstButton() {
        navigationController?.pushViewController(TimurFirstVC(), animated: true)
    }
    
    @objc private func didTapSecondButton() {
        navigationController?.pushViewController(NikolaiFirstVC(), animated: true)
    }
}

