//
//  TimurFirstVC.swift
//  ProSaleSecondPart
//
//  Created by Nikolai Salmin on 22.12.2022.
//

import UIKit
import SnapKit

final class TimurFirstVC: UIViewController {

    private enum Constants {
        static let cellId = "cellId"
        static let sellerPageScheduleCell = "SellerPageScheduleCell"
        static let sellerAdvertsCell = "SellerAdvertsCell"
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.register(SellerPageLocationCell.self, forCellReuseIdentifier: Constants.cellId)
        tableView.register(SellerPageScheduleCell.self, forCellReuseIdentifier: Constants.sellerPageScheduleCell)
        tableView.register(SellerAdvertsCell.self, forCellReuseIdentifier: Constants.sellerAdvertsCell)
        
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
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension TimurFirstVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellId,
                                                     for: indexPath) as! SellerPageLocationCell
            cell.configure(mainAddress: "г.Алматы, ул. Жибек Жолы, 25",
                           additionalAddress: "рынок “Жибек Жолы” 2 ряд 25 контейнер")
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sellerPageScheduleCell,
                                                     for: indexPath) as! SellerPageScheduleCell
            cell.configure(isOpen: true,
                           title: "Открыто до 20:00")
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.sellerAdvertsCell,
                                                     for: indexPath) as! SellerAdvertsCell
            cell.configure(name: "Объявления продавца")
            return cell
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
