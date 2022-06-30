//
//  ViewController.swift
//  iOSDemo
//
//  Created by Apple on 29/06/22.
//

import UIKit
import SDWebImage

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
        tblView.estimatedRowHeight = 100
        
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
        
        if let cell = tableview?.dequeueReusableCell(withIdentifier: "CellIdentifier") as? FactViewCell
        {
            cell.lblDescription.numberOfLines = 0
            cell.lblTitle.text = factModel.title ?? "__"
            cell.lblDescription.text = factModel.rowDescription ?? "__"

            if let url = URL(string: factModel.imageHref ?? "") {
                cell.imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "image_loading"))
            }else{
                cell.imgView.image = UIImage(named: "no_image")
            }
            

            return cell
        }else {
            let cell = FactViewCell(style: .default, reuseIdentifier: "CellIdentifier") as FactViewCell
            cell.lblTitle.numberOfLines = 0
            cell.lblTitle.text = factModel.title
            cell.lblDescription.text = factModel.rowDescription
            
            if let url = URL(string: factModel.imageHref ?? "") {
                cell.imgView.sd_setImage(with: url, placeholderImage: UIImage(named: "image_loading"))
            }else{
                cell.imgView.image = UIImage(named: "no_image")
            }
            
            return cell
        }
    }
    
    
}
