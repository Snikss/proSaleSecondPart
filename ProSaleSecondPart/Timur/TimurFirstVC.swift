//
//  TimurFirstVC.swift
//  ProSaleSecondPart
//
//  Created by Nikolai Salmin on 22.12.2022.
//

import UIKit
import SnapKit

final class TimurFirstVC: UIViewController {
    
    let models = [
        SellerModel(id: 111,
                    sellerId: 111,
                    title: "Автозапчасти Алматы",
                    subtitle: "7 лет на Kolesa.kz"),
            SellerModel(id: 111,
                        sellerId: 111,
                        title: "Автозапчасти Алматы",
                        subtitle: "7 лет на Kolesa.kz",
                        advertsCount: "1000 объявлений",
                        actionButton: "Страница продавца")
    ]
    
    let cellId = "cellId"
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(SellerInfoTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension TimurFirstVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destinationVC = SellerViewController()
        destinationVC.configureVC(model: models[indexPath.row])
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SellerInfoTableViewCell
        cell.configure(model: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
