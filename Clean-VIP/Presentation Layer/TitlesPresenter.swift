//
//  TitlesPresenter.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import Foundation

protocol TitlesPresenterOutput: class {
    
}

protocol TitlesPresenter: class {
    
}

class TitlesPresenterImplementation: TitlesPresenter {
    weak var viewController: TitlesPresenterOutput?
}
