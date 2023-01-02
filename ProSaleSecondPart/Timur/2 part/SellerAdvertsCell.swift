//
//  SellerAdvertsCell.swift
//  ProSaleSecondPart
//
//  Created by Timur Kaldybek on 30.12.2022.
//
import UIKit
import Foundation

final class SellerAdvertsCell: UITableViewCell {
    private enum Constants {
        static let cellId = "cellId"
    }
    
    private let models = [Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40),
                          Model(categoryName: "Автозапчасти", count: 999),
                          Model(categoryName: "Шины", count: 10),
                          Model(categoryName: "Диски", count: 40)]
    
    private let sellerName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        
        return label
    }()
    
    private let filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Фильтр", for: .normal)
        button.setTitleColor(Color.bluePrimary, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        return button
    }()
    
    private let filterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "filter")
        return imageView
    }()
    
    private let numberOfFiltersSelected: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.layer.bounds.size.width = 20
        label.layer.cornerRadius = 6
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "1"
        label.isHidden = true
        return label
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: Constants.cellId)
        collectionView.showsHorizontalScrollIndicator = false
        //        collectionView.isPagingEnabled = true
        
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        collectionView.dataSource = self
        collectionView.delegate = self
        setupSubviews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    func configure(name: String) {
        self.sellerName.text = name
    }
    
    private func setupSubviews() {
        [sellerName,
         filterButton,
         filterImage,
         numberOfFiltersSelected,
         collectionView].forEach(contentView.addSubview)
    }
    
    private func setupConstraints() {
        sellerName.snp.makeConstraints {
            $0.top.left.equalToSuperview().offset(16)
            $0.right.equalTo(filterButton.snp.left).offset(-16)
        }
        filterButton.snp.makeConstraints {
            $0.right.equalTo(filterImage.snp.left).offset(-8)
            $0.height.equalTo(20)
            $0.width.equalTo(56)
            $0.top.equalToSuperview().offset(16)
        }
        filterImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.width.height.equalTo(16)
            $0.right.equalToSuperview().offset(-21)
        }
        numberOfFiltersSelected.snp.makeConstraints {
            $0.top.equalTo(filterImage.snp.top).offset(-6)
            $0.left.equalTo(filterImage.snp.right).offset(-6)
        }
        collectionView.snp.makeConstraints {
            $0.top.equalTo(sellerName.snp.bottom).offset(16)
            $0.right.equalToSuperview()
            $0.left.equalToSuperview().offset(16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.equalTo(40)
        }
    }
}

extension SellerAdvertsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellId,
                                                      for: indexPath) as! CategoryCell
        cell.configure(category: models[indexPath.row].categoryName, count: models[indexPath.row].count)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at:indexPath, at: UICollectionView.ScrollPosition.left, animated: true)
    }
}
