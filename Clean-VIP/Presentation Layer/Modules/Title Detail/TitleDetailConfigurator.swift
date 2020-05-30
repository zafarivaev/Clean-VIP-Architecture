//
//  TitleDetailConfigurator.swift
//  Clean-VIP
//
//  Created by Zafar on 5/29/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

class TitleDetailConfigurator {
    
    static func configureModule(titleId: String,
                                viewController: TitleDetailViewController) {
        let view = TitleDetailView()
        let router = TitleDetailRouterImplementation()
        let interactor = TitleDetailInteractorImplementation()
        let presenter = TitleDetailPresenterImplementation()
        
        interactor.titleId = titleId
        
        viewController.titleDetailView = view
        viewController.router = router
        viewController.interactor = interactor
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
    }
}
