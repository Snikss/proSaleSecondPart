//
//  SellerPageInfoCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 27.12.2022.
//


final class SellerPageInfoCell: UITableViewCell {
    private enum Constants {
        static let imagePlaceholder = "seller_logo_placeholder"
    }
    
    private let companyLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.frame.size.width = 64
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupSubviews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(urlString: String?, title: String, subtitle: String) {
        companyLogo.image = UIImage(named: urlString ?? Constants.imagePlaceholder)
        titleLabel.text = title
        descriptionLabel.text = subtitle
    }
    
    private func setupSubviews() {
        [companyLogo,
         titleLabel,
         descriptionLabel].forEach(contentView.addSubview)
    }
    
    private func setupConstraints() {
        companyLogo.snp.makeConstraints {
            $0.left.equalToSuperview().offset(8)
            $0.top.bottom.equalToSuperview()
            $0.width.height.equalTo(64)
        }
        
        titleLabel.snp.makeConstraints {
            $0.left.equalTo(companyLogo.snp.right).offset(16)
            $0.top.equalToSuperview().offset(6)
            $0.right.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.left.equalTo(companyLogo.snp.right).offset(16)
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.right.equalToSuperview()
        }
    }
}
