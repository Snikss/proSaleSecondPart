//
//  SellerViewController.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 25.12.2022.
//

import UIKit
import SnapKit

class SellerViewController: UIViewController {
    private let headerView = DealerHeaderView()
    private var model: SellerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(headerView)
        setupViews()
    }
    
    func configureVC(model: SellerModel?) {
        self.model = model
    }
    
    private func setupViews() {
//        headerView.configure(model: model)
        headerView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(64)
        }
    }
}
