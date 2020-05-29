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
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
