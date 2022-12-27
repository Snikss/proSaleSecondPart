//
//  DealerHeaderView.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 25.12.2022.
//

import Foundation
import UIKit
import SnapKit

class DealerHeaderView: UIView {
    
    private let companyLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = imageView.frame.size.width / 2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    func configure(model: SellerModel?) {
        guard let model else { return }
//        companyLogo.image = model.companyLogo
//        titleLabel.text = model.title
//        descriptionLabel.text = model.description
        backgroundColor = .white
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        [companyLogo, titleLabel, descriptionLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setupConstraints() {
        companyLogo.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.top.bottom.equalToSuperview()
            make.width.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(companyLogo.snp.right).offset(16)
            make.top.equalToSuperview().offset(6)
            make.right.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.left.equalTo(companyLogo.snp.right).offset(16)
            make.right.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
