//
//  ViewController.swift
//  LeroyMerlin
//
//  Created by Сэнди Белка on 19.04.2021.
//

import UIKit

class SearchViewController: UIViewController {
    
    static var searchView: UIView?
    
    public let miniView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "tabBarSelected")
        return view
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск товаров"
        label.font = UIFont(name: "Kailasa Bold", size: 30)
        label.textAlignment = .left
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitle("  Поиск", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.contentHorizontalAlignment = .left
        
        return button
    }()
    
    private let magnifyingglassButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "tabBarSelected")
        button.tintColor = .white
        button.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let scanButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "Barcode"), for: .normal)
        return button
    }()
    
    public let tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.register(CustomCellTableView.self, forCellReuseIdentifier: "identifierCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()


    
    override func viewDidLoad() {
        super.viewDidLoad()
        SearchViewController.searchView = view
        view.addSubview(miniView)
        miniView.addSubview(searchLabel)
        miniView.addSubview(searchButton)
        miniView.addSubview(scanButton)
        miniView.addSubview(magnifyingglassButton)
        setupNavigationBar()
        setupTableView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        searchButton.layer.cornerRadius = 5
        magnifyingglassButton.layer.cornerRadius = 5
        scanButton.layer.cornerRadius = 5
    }
    
    private func setupNavigationBar() {
        let button = UIButton()
        button.setTitle("Поиск", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 0)
        button.contentHorizontalAlignment = .left
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: button)
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupTableView() {
        tableView.rowHeight = view.bounds.height / 3 + 30
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            
            miniView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            miniView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            miniView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            miniView.heightAnchor.constraint(equalToConstant: view.frame.height / 3 - 30),
            
            searchLabel.centerYAnchor.constraint(equalTo: miniView.centerYAnchor, constant: -10),
            searchLabel.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 20),
            searchLabel.heightAnchor.constraint(equalToConstant: view.bounds.height / 13),

            searchButton.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 8),
            searchButton.leftAnchor.constraint(equalTo: miniView.leftAnchor, constant: 20),
            searchButton.heightAnchor.constraint(equalToConstant: view.bounds.height / 15),
            searchButton.rightAnchor.constraint(equalTo: scanButton.leftAnchor, constant: -15),

            magnifyingglassButton.rightAnchor.constraint(equalTo: searchButton.rightAnchor, constant: -5),
            magnifyingglassButton.topAnchor.constraint(equalTo: searchButton.topAnchor, constant: 5),
            magnifyingglassButton.heightAnchor.constraint(equalToConstant: (view.bounds.height / 15) - 10),
            magnifyingglassButton.widthAnchor.constraint(equalToConstant: view.bounds.height / 15),

            scanButton.topAnchor.constraint(equalTo: searchLabel.bottomAnchor, constant: 8),
            scanButton.rightAnchor.constraint(equalTo: miniView.rightAnchor, constant: -20),
            scanButton.heightAnchor.constraint(equalToConstant: view.bounds.height / 15),
            scanButton.widthAnchor.constraint(equalToConstant: view.bounds.height / 15),

            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: miniView.bottomAnchor, constant: 0),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.height)
        ])
    }
    
}

