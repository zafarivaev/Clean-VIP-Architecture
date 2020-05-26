//
//  ViewController.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

class TitlesViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        titlesView?.tableView.delegate = self
        titlesView?.tableView.dataSource = self
        self.view = titlesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Properties
    var titlesView: TitlesView?
    var interactor: TitlesInteractor?
    var router: TitlesRouter?
    
    private var titles: [String] = ["test", "1", "3"]

}

// MARK: - Presenter Output
extension TitlesViewController: TitlesPresenterOutput {
    
}

// MARK: - UITableView DataSource & Delegate
extension TitlesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }
}
