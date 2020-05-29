//
//  ViewController.swift
//  Clean-VIP
//
//  Created by Zafar on 5/26/20.
//  Copyright © 2020 Zafar. All rights reserved.
//

import UIKit

protocol TitlesPresenterOutput: class {
    func presenter(_ presenter: TitlesPresenter, didRetrieveItems items: [String])
    func presenter(_ presenter: TitlesPresenter, didFailRetrieveItems message: String)
    
    func presenter(_ presenter: TitlesPresenter, didAddItem item: String)
    func presenter(_ presenter: TitlesPresenter, didFailAddItem message: String)
}

class TitlesViewController: UIViewController {

    // MARK: - Lifecycle Methods
    override func loadView() {
        super.loadView()
        self.view = titlesView
        
        titlesView?.tableView.delegate = self
        titlesView?.tableView.dataSource = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Titles"
        self.navigationItem.rightBarButtonItem = addBarButtonItem
    }
    
    // MARK: - Actions
    @objc func addBarButtonItemTapped() {
        let alert = UIAlertController(
            title: "Add a new title",
            message: nil,
            preferredStyle: .alert
        )
        
        alert.addTextField { (textField) in
            textField.placeholder = "Text"
        }
        
        let okAction = UIAlertAction(
            title: "Add",
            style: .default
        ) { [unowned self] (action) in
            self.interactor?.addTapped(with: alert.textFields?.first?.text ?? "")
        }
        
        let cancelAction = UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: nil
        )
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Properties
    var titlesView: TitlesView?
    var interactor: TitlesInteractor?
    var router: TitlesRouter?
    
    private var items: [String] = []
    
    lazy var addBarButtonItem: UIBarButtonItem = {
        let item = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addBarButtonItemTapped)
        )
        return item
    }()

}

// MARK: - Presenter Output
extension TitlesViewController: TitlesPresenterOutput {
    
    func presenter(_ presenter: TitlesPresenter, didRetrieveItems items: [String]) {
        self.items = items
        self.titlesView?.reloadTableView()
    }
    
    func presenter(_ presenter: TitlesPresenter, didFailRetrieveItems message: String) {
        // Show error alert
        print(message)
    }
    
    func presenter(_ presenter: TitlesPresenter, didAddItem item: String) {
        self.items.append(item)
        self.titlesView?.insertRow(at: self.items.count - 1)
    }
    
    func presenter(_ presenter: TitlesPresenter, didFailAddItem message: String) {
        // Show error alert
        print(message)
    }
}

// MARK: - UITableView DataSource & Delegate
extension TitlesViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView
            .dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = self.items[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
}
