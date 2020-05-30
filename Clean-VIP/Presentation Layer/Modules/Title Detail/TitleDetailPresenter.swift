//
//  TitleDetailPresenter.swift
//  Clean-VIP
//
//  Created by Zafar on 5/29/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

protocol TitleDetailPresenter: class {
    func interactor(didRetrieveTitle title: Title)
    func interactor(didFailRetrieveTitle error: Error)
}

class TitleDetailPresenterImplementation: TitleDetailPresenter {
    
    var viewController: TitleDetailPresenterOutput?
    
    func interactor(didRetrieveTitle title: Title) {
        let titleString = title.text
        viewController?.presenter(didRetrieveItem: titleString ?? "")
    }
    
    func interactor(didFailRetrieveTitle error: Error) {
        viewController?.presenter(didFailRetrieveItem: error.localizedDescription)
    }
}
