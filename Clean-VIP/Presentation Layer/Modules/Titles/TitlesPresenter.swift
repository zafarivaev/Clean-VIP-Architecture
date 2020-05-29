//
//  TitlesPresenter.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

protocol TitlesPresenter: class {
    func interactor(didRetrieveTitles titles: [Title])
    func interactor(didFailRetrieveTitles error: Error)
    
    func interactor(didAddTitle title: Title)
    func interactor(didFailAddTitle error: Error)
    
    func interactor(didFindTitle title: Title)
}

class TitlesPresenterImplementation: TitlesPresenter {
    weak var viewController: TitlesPresenterOutput?
    
    func interactor(didRetrieveTitles titles: [Title]) {
        let titlesStrings = titles.compactMap { $0.text }
        viewController?.presenter(didRetrieveItems: titlesStrings)
    }
    
    func interactor(didFailRetrieveTitles error: Error) {
        viewController?.presenter(didFailRetrieveItems: error.localizedDescription)
    }
    
    func interactor(didAddTitle title: Title) {
        if let titleString = title.text {
            viewController?.presenter(didAddItem: titleString)
        }
    }
    
    func interactor(didFailAddTitle error: Error) {
        viewController?.presenter(didFailAddItem: error.localizedDescription)
    }
    
    func interactor(didFindTitle title: Title) {
        if let id = title.id {
            viewController?.presenter(didObtainItemId: id)
        }
    }
}
