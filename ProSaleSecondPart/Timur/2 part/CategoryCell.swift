//
//  CategoryCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 01.01.2023.
//

import Foundation

final class CategoryCell: UICollectionViewCell {
    
    override var isSelected: Bool {
        didSet {
            if isSelected { // Selected cell
                self.backgroundColor = Color.blueLighter
            } else { // Normal cell
                self.backgroundColor = .white
           }
        }
    }
    
    private let categoryName: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    private let numberOfAdverts: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = CGColor(gray: 0.8, alpha: 1)
        
        setupSubview()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        assertionFailure("init(coder:) has not been implemented")
        return nil
    }
    
    func configure(category: String, count: Int) {
        categoryName.text = category
        numberOfAdverts.text = "\(count)"
    }
    
    private func setupSubview() {
        [categoryName,
         numberOfAdverts].forEach(contentView.addSubview)
    }
    
    private func setupConstraints() {
        categoryName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalTo(numberOfAdverts.snp.left).offset(-4)
        }
        numberOfAdverts.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.right.equalToSuperview().offset(-16)
            $0.left.equalTo(categoryName.snp.right).offset(4)
        }
    }
}
