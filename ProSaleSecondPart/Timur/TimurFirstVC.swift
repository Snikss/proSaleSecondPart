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
        Model(title: "Автозапчасти Алматы",
              description: "7 лет на Kolesa.kz",
              numberOfAdverts: "1000 объявлений"),
        Model(title: "Автозапчасти Алматы",
              description: "7 лет на Kolesa.kz",
              numberOfAdverts: nil),
        Model(title: "Автозапчасти Алматы",
              description: "7 лет на Kolesa.kz",
              numberOfAdverts: "1000 объявлений")
    ]
    
    let cellId = "cellId"
    private let tableView = UITableView()
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setupTableView()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension TimurFirstVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomTableViewCell
        cell.configure(model: models[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
