//
//  ViewController.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import UIKit

class ViewController: UIViewController {
    private var tableview:UITableView?
    private var viewModel = FactListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        configureUI()
        viewModel.factList.bind { (factListModel) in
            DispatchQueue.main.async {
                self.navigationItem.title = factListModel.title
                self.tableview?.reloadData()
            }
        }
        viewModel.fetchFactList { (result) in
            
        }
    }
    
    
    //MARK: - configure UI
    func configureUI(){
        let tblView = UITableView()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.rowHeight = UITableView.automaticDimension
        tblView.estimatedRowHeight = 1000
        
        view.addSubview(tblView)
        tblView.translatesAutoresizingMaskIntoConstraints = false
        tblView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tblView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tblView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.tableview = tblView
    }


}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let c = viewModel.factList.value.rows.count
        return c
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let factModel = viewModel.factList.value.rows[indexPath.row]
        
        if let cell = tableview?.dequeueReusableCell(withIdentifier: "CellIdentifier")
        {
            cell.detailTextLabel?.numberOfLines = 0
            cell.textLabel?.text = factModel.title
            cell.detailTextLabel?.text = factModel.rowDescription
            cell.imageView?.image = UIImage(named: "flag_of_canada")
            return cell
        }else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellIdentifier")
            cell.detailTextLabel?.numberOfLines = 0            
            cell.textLabel?.text = factModel.title
            cell.detailTextLabel?.text = factModel.rowDescription
            cell.imageView?.image = UIImage(named: "flag_of_canada")
            return cell
        }
    }
    
    
}
