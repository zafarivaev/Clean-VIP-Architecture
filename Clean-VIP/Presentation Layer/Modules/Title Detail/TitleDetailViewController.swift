//
//  TitleDetailViewController.swift
//  Clean-VIP
//
//  Created by Zafar on 5/29/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

protocol TitleDetailPresenterOutput: class {
    
}

class TitleDetailViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = titleDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Properties
    var titleDetailView: TitleDetailView?
    var interactor: TitleDetailInteractor?
    weak var presenter: TitleDetailPresenter?
    var router: TitleDetailRouter?
    
}

// MARK: - Presenter Output
extension TitleDetailViewController: TitleDetailPresenterOutput {
    
}
