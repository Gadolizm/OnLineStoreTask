//
//  CartViewController.swift
//  OnLineStoreTask
//
//  Created by Gado on 26/08/2022.
//

import UIKit

class CartViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var cartTableView: UITableView!
    
    
    // MARK: - Properties
    
    private let viewModel = CartViewModel()
    
    
    
    // MARK: - Override Functions
    // viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableConfiguration()
        viewModel.refreshProducts()
        viewModel.productsDidRefresh = {[weak self] in
            self?.cartTableView.reloadData()
        }
    }
    
    
    // MARK: - Actions
    
    func tableConfiguration(){
        
        cartTableView.delegate = self
        cartTableView.dataSource  = self
        let nib = UINib(nibName: CartTableViewCell.identifier, bundle: nil)
        cartTableView.register(nib, forCellReuseIdentifier: CartTableViewCell.identifier)
    }
    
    // MARK: - Methods
    

}

extension CartViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredCartProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CartTableViewCell.identifier, for: indexPath) as! CartTableViewCell
        cell.modify(product: viewModel.filteredCartProducts[indexPath.row])
        return cell
    }
    
    
    
}
