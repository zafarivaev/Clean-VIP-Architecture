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
}

class TitlesInteractorImplementation: TitlesInteractor {
    var presenter: TitlesPresenter?
}
