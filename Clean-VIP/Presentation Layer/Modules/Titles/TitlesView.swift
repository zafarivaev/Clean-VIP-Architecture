//
//  TitlesView.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class TitlesView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func showPlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.alpha = 1.0
            self.tableView.alpha = 0.0
        }
    }
    
    public func hidePlaceholder() {
        UIView.animate(withDuration: 0.3) {
            self.placeholderLabel.alpha = 0.0
            self.tableView.alpha = 1.0
        }
    }
    
    public func reloadTableView() {
        self.tableView.reloadData()
    }
    
    public func insertRow(at index: Int, section: Int = 0) {
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: [
            IndexPath(
                row: index,
                section: section
            )
        ], with: .automatic)
        self.tableView.endUpdates()
    }
    
    public func deleteRow(at index: Int, section: Int = 0) {
        self.tableView.beginUpdates()
        self.tableView.deleteRows(at: [
            IndexPath(
                row: index,
                section: section
            )
        ], with: .automatic)
        self.tableView.endUpdates()
    }
    
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 70
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Heavy", size: 25)
        label.text = "No items yet, add one!"
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - UI Setup
extension TitlesView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.backgroundColor = .white
        
        self.addSubview(tableView)
        self.addSubview(placeholderLabel)
        
        NSLayoutConstraint.activate([
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
        ])
        
        NSLayoutConstraint.activate([
            placeholderLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            placeholderLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
