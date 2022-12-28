//
//  SellerPageScheduleCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 28.12.2022.
//

import UIKit

final class SellerPageScheduleCell: UITableViewCell {
    private enum Constants {
        static let arrowImage = "light_bracket"
        static let titleFontSize: CGFloat = 16
        static let redCircle = "red_oval"
        static let greenCircle = "green_oval"
    }
    
    private let workIndicator: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: Constants.titleFontSize, weight: .regular)
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
    
    func configure(isOpen: Bool, title: String) {
        workIndicator.image = UIImage(named: isOpen ? Constants.greenCircle : Constants.redCircle)
        titleLabel.text = title
    }
    
    private func setupSubview() {
        [workIndicator,
         titleLabel,
         arrowButton].forEach(contentView.addSubview)
    }
    
    private func setupConstraints() {
        workIndicator.snp.makeConstraints {
            $0.left.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalTo(workIndicator.snp.right).offset(16)
            $0.right.equalTo(arrowButton.snp.left).offset(-22)
            $0.bottom.equalToSuperview().offset(-10)
        }
        
        arrowButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(7)
            $0.height.equalTo(10)
            $0.right.equalToSuperview().offset(-20)
        }
    }
}
