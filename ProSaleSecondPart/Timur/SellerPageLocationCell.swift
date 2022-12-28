//
//  SellerPageLocationCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 28.12.2022.
//

import UIKit

final class SellePageLocationCell: UITableViewCell {
    private enum Constants {
        static let arrowImage = "light_bracket"
        static let locationLogo = "location_logo"
        static let titleFontSize: CGFloat = 16
        static let subtitleFontSize: CGFloat = 13
    }
    
    private let locationLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: Constants.locationLogo)
        return imageView
    }()
    
    private let mainAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let additionalAddressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: Constants.subtitleFontSize, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let arrowButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: Constants.arrowImage), for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupSubview()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func configure(mainAddress: String, additionalAddress: String) {
        mainAddressLabel.text = mainAddress
        additionalAddressLabel.text = additionalAddress
    }
    
    private func setupSubview() {
        [locationLogo,
         mainAddressLabel,
         additionalAddressLabel,
         arrowButton].forEach(contentView.addSubview)
    }
    
    private func setupConstraints() {
        locationLogo.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        mainAddressLabel.snp.makeConstraints {
            $0.left.equalTo(locationLogo.snp.right).offset(16)
            $0.top.equalToSuperview().offset(6)
            $0.right.equalTo(arrowButton.snp.left).offset(-22)
        }
        
        additionalAddressLabel.snp.makeConstraints {
            $0.left.equalTo(locationLogo.snp.right).offset(16)
            $0.top.equalTo(mainAddressLabel.snp.bottom).offset(4)
            $0.right.equalTo(arrowButton.snp.left).offset(-22)
            $0.bottom.equalToSuperview().offset(-6)
        }
        
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(7)
            $0.height.equalTo(10)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
