//
//  TableViewController.swift
//  hometask_lesson14
//
//  Created by Ирина Громова on 24.05.2024.
//

import UIKit

struct User {
    let firstName: String
    let middleName: String
    let lastName: String
    var fullName: String { lastName + " " + firstName + " " + middleName }
    let position: String
    let address: String
}

class TableViewController: UIViewController {
    private let users: [User] = [ User(firstName: "Ирина", middleName: "Олеговна", lastName: "Громова", position: "Разработчик", address: "Санкт-Петербург, ул. Литейная, д. 2"), User(firstName: "Андрей", middleName: "Александрович", lastName: "Иванов", position: "Менеджер", address: "Уфа, ул. Островского, д. 5/1"),
        User(firstName: "Геннадий", middleName: "Петрович", lastName: "Букин", position: "Директор", address: "Тверь, ул. Лесная, д. 4"),
        User(firstName: "Виктория", middleName: "Владимировна", lastName: "Шаталина", position: "Старший менеджер", address: "Москва, ул. Ленина, д. 47"),
    ]

    private lazy var tableView: UITableView = {
        let tableView = UITableView(
            frame: .init(x: 0, y: 0, width: 393, height: 852),
            style: .insetGrouped
        )
        
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 100
        tableView.separatorStyle = .none
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "DefaultCellId")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
    }
    
}

extension TableViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCellId", for: indexPath) as! TableViewCell
        
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        cell.titleLabel.text = users[indexPath.row].fullName
        cell.tag = indexPath.row
        
        return cell
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "ViewControllerID") as! ViewController
        guard let cell = sender.superview?.superview as? UITableViewCell else { return }
        
        viewController.data = users[cell.tag]
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
