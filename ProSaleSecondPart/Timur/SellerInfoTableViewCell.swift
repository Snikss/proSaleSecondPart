//
//  SellerInfoTableViewCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import UIKit
import SnapKit

final class SellerInfoTableViewCell: UITableViewCell {
    
    private enum Constants {
        static let arrowImage = "light_bracket"
        static let cornerRadius: CGFloat = 8
        static let titleFontSize: CGFloat = 18
        static let numberOfLines = 1
        static let subtitleFontSize: CGFloat = 14
        static let buttonFontSize: CGFloat = 16
        static let lineHeight = 1
    }
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.whiteDarkest
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: Constants.titleFontSize)
        label.textAlignment = .left
        label.numberOfLines = Constants.numberOfLines
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize)
        label.textAlignment = .left
        label.numberOfLines = Constants.numberOfLines
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var advertsCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Constants.subtitleFontSize)
        label.textAlignment = .left
        label.textColor = .gray
        label.numberOfLines = Constants.numberOfLines
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private lazy var line: UIView = {
        let view = UIView()
        view.backgroundColor = Color.grayLightest
        return view
    }()
    
    private lazy var goToCabinetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font.withSize(Constants.buttonFontSize)
        button.setTitleColor(Color.bluePrimary, for: .normal)
        button.contentHorizontalAlignment = .left
        return button
    }()
    
    private lazy var buttonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = Color.gray
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        setupMainInfoView()
        setupMainInfoConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func configure(model: SellerModel) {
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        
        guard let numberOfAdverts = model.advertsCount,
              let buttonText = model.actionButton else {
            return
        }
        setupDealerView()
        setupDealerInfoConstraints()
        buttonImageView.image = UIImage(named: Constants.arrowImage)
        advertsCountLabel.text = numberOfAdverts
        goToCabinetButton.setTitle(buttonText, for: .normal)
    }
    
    private func setupMainInfoView() {
        contentView.addSubview(containerView)
        [titleLabel,
         subtitleLabel].forEach(containerView.addSubview)
    }

    private func setupDealerView() {
        [advertsCountLabel,
         line,
         goToCabinetButton,
         buttonImageView].forEach(containerView.addSubview)
    }
    
    private func setupMainInfoConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setupDealerInfoConstraints() {
        subtitleLabel.snp.remakeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        advertsCountLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(Constants.lineHeight)
            make.top.equalTo(advertsCountLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        goToCabinetButton.snp.makeConstraints { make in
            make.top.equalTo(line.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalTo(buttonImageView.snp.left)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        buttonImageView.snp.makeConstraints { make in
            make.height.equalTo(15)
            make.width.equalTo(8)
            make.right.equalToSuperview().offset(-16)
            make.centerY.equalTo(goToCabinetButton.snp.centerY)
        }
    }
}
