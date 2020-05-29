//
//  TitlesConfigurator.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

protocol TitlesConfigurator: class {
    func configure(viewController: TitlesViewController)
}

class TitlesConfiguratorImplementation: TitlesConfigurator {
    
    func configure(viewController: TitlesViewController) {
        let view = TitlesView()
        let router = TitlesRouterImplementation()
        let interactor = TitlesInteractorImplementation()
        let presenter = TitlesPresenterImplementation()
        
        viewController.titlesView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
