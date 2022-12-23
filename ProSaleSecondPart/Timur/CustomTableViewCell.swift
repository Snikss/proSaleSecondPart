//
//  CustomTableViewCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 22.12.2022.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    private var model: TypeModel?
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.whiteDarkest
        view.layer.cornerRadius = 8
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let numberOfAdvertsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        label.textColor = .gray
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let line: UIView = {
        let view = UIView()
        view.backgroundColor = Color.lineColor
        view.isHidden = true
        return view
    }()
    
    private let goToCabinetButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("Страница продавца", for: .normal)
        button.titleLabel?.font.withSize(16)
        button.setTitleColor(Color.bluePrimary, for: .normal)
        button.contentHorizontalAlignment = .left;
        button.isHidden = true
        return button
    }()
    
    func configure(model: TypeModel?) {
        guard let model else { return }
        
        switch model.cabinetType {
        case .pro:
            titleLabel.text = model.title
            descriptionLabel.text = model.description
        case .dealer:
            titleLabel.text = model.title
            descriptionLabel.text = model.description
            numberOfAdvertsLabel.text = model.numberOfAdverts
            goToCabinetButton.isHidden = !(model.needShowButton ?? false)
            line.isHidden = !(model.needShowButton ?? false)
        }
        setupConstraints(model: model)
    }
    
    private func setupConstraints(model: TypeModel){
        switch model.cabinetType {
        case .dealer:
            setupDealerViewConstraints()
        case .pro:
            setupProViewConstraints()
        }
    }
    
    private func setupProViewConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setupDealerViewConstraints() {
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
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        numberOfAdvertsLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(6)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        line.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(numberOfAdvertsLabel.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        goToCabinetButton.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.top.equalTo(line.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(containerView)
        
        [titleLabel, descriptionLabel, numberOfAdvertsLabel, line, goToCabinetButton].forEach {
            containerView.addSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
