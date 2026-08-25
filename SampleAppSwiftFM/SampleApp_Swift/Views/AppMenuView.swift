//
//  AppMenuView.swift
//  SampleApp_Swift
//
//  Created by ephrim.daniel on 23/01/25.
//

import UIKit

protocol appMenuViewDelegate: NSObject {
    func selectedMenu(menu : Menu)
}

class AppMenuTableView: UIView {

    var menus = [Menu]()

    weak var delegate: appMenuViewDelegate? = nil

    lazy var tableView : UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .systemBackground
        view.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        self.addSubview(tableView)
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
    }

    func updateUI(menus: [Menu]) {
        self.menus = menus
        DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
            self.tableView.reloadData()
        })
    }
}


extension AppMenuTableView : UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Swift UIKit"
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        cell.textLabel?.text = menus[indexPath.row].pageName
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = .secondarySystemGroupedBackground
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedMenu = menus[indexPath.row]
        self.delegate?.selectedMenu(menu: selectedMenu)
    }
}
