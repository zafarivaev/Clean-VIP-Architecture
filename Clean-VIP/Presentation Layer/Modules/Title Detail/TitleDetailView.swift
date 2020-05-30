//
//  TitleDetailView.swift
//  Clean-VIP
//
//  Created by Zafar on 5/29/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class TitleDetailView: UIView {
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    public func updateLabel(with text: String) {
        titleLabel.text = text
    }
    
    // MARK: - Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 25)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

// MARK: - UI Setup
extension TitleDetailView {
    private func setupUI() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.backgroundColor = .white
        
        self.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
