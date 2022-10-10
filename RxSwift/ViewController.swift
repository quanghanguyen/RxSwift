//
//  ViewController.swift
//  RxSwift
//
//  Created by Nguyen Quang Ha on 10/10/2022.
//

import UIKit
import RxCocoa
import Pods_RxSwift

class ViewController: UIViewController {
    
    private let viewModel = ProductViewModel()
    
    private var bag = DisposeBag()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    private func bindTableData() {
        //Bind items to table
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)) { row, item, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)
        
        //Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind {product in
            print(product.title)
        }.disposed(by: bag)
        
        //fetch items
        viewModel.fetchItems()
    }
    
}

