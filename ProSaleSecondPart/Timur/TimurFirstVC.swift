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
        TypeModel(cabinetType: .dealer,
                  title: "Автозапчасти Алматы",
                  description: "7 лет на Kolesa.kz",
                  numberOfAdverts: "1000 объявлений",
                  needShowButton: true),
        TypeModel(cabinetType: .pro,
                  title: "Автозапчасти Алматы",
                  description: "7 лет на Kolesa.kz"),
        TypeModel(cabinetType: .dealer,
                  title: "Автозапчасти Алматы",
                  description: "7 лет на Kolesa.kz",
                  numberOfAdverts: "1000 объявлений",
                  needShowButton: true),
        TypeModel(cabinetType: .dealer,
                  title: "Автозапчасти Алматыmlbvkfmdblkgmfblkbmlkfmb",
                  description: "99999999999999999999999 лет на Kolesa.kz",
                  numberOfAdverts: "99999999999999999999999999999 объявлений",
                  needShowButton: true),
        TypeModel(cabinetType: .pro,
                  title: "Автозапчасти klmlkmlkmlkmflkvfmbldfkbmlkdfbmАлматы",
                  description: "99999999999999999999999999999 лет на Kolesa.kz")
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
       switch models[indexPath.row].cabinetType {
       case .dealer:
           return 150
       case .pro:
           return 80
        }
    }
}
