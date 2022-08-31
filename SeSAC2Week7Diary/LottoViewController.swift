//
//  LottoViewController.swift
//  SeSAC2Week7Diary
//
//  Created by Brother Model on 2022/08/30.
//

import UIKit

class LottoViewController: UIViewController {
    
    private var viewModel = PersonViewModel()
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    @IBOutlet weak var lottoLabel: UILabel!
    
    var list : Person = Person(page: 0, totalPages: 0, totalResults: 0, results: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchPerson(query: "kim")
        
        viewModel.list.bind { person in
            self.tableView.reloadData()
        }
    }
}

extension LottoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! //tableView.dequeueReusableCell(withIdentifier: "cell")!
//        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "cell")
        
        let data = viewModel.cellForRowAt(at: indexPath)
        
        cell.textLabel?.text =  data.name //list.results[indexPath.row].name
        cell.detailTextLabel?.text = data.knownForDepartment // list.results[indexPath.row].knownForDepartment
        return cell
    }
}
