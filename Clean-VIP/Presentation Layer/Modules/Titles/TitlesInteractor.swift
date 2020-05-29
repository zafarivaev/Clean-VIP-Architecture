//
//  TitlesInteractor.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

protocol TitlesInteractor: class {
    var presenter: TitlesPresenter? { get }
    
    func viewDidLoad()
    func addTapped(with text: String)
}

class TitlesInteractorImplementation: TitlesInteractor {
    var presenter: TitlesPresenter?
    
    private let titlesService = TitlesServiceImplementation()
    
    func viewDidLoad()  {
        do {
            let titles = try titlesService.getTitles()
            presenter?.interactor(didRetrieveTitles: titles)
        } catch {
            presenter?.interactor(didFailRetrieveTitles: error)
        }
    }
    
    func addTapped(with text: String) {
        do {
            let title = try titlesService.addTitle(text: text)
            presenter?.interactor(didAddTitle: title)
        } catch {
            presenter?.interactor(didFailAddTitle: error)
        }
    }
}
