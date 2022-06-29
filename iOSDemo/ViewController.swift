//
//  ViewController.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import UIKit

class ViewController: UIViewController {
    private var tableview:UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        configureUI()
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
        
    }


}
extension ViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableview?.dequeueReusableCell(withIdentifier: "CellIdentifier")
        {
            cell.textLabel?.text = "\(indexPath.row)"
            cell.detailTextLabel?.text = "test test test"
            cell.imageView?.image = UIImage(named: "flag_of_canada")
            return cell
        }else {
            let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "CellIdentifier")
            cell.textLabel?.text = "\(indexPath.row)"
            cell.detailTextLabel?.text = "test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test test."
            cell.detailTextLabel?.numberOfLines = 0
            cell.imageView?.image = UIImage(named: "flag_of_canada")
            return cell
        }
    }
    
    
}
