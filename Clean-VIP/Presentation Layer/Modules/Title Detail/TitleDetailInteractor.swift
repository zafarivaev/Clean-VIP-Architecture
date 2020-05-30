//
//  TitleDetailInteractor.swift
//  Clean-VIP
//
//  Created by Zafar on 5/29/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

protocol TitleDetailInteractor: class {
    var titleId: String? { get }
    
    func viewDidLoad()
}

class TitleDetailInteractorImplementation: TitleDetailInteractor {
    
    var titleId: String?
    
    var presenter: TitleDetailPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad() {
        do {
            if let title = try titlesService.getTitle(with: self.titleId!) {
                presenter?.interactor(didRetrieveTitle: title)
            }
        } catch {
            presenter?.interactor(didFailRetrieveTitle: error)
        }
    }
}
