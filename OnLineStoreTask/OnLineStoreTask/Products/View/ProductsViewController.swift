//
//  ProductsViewController.swift
//  OnLineStoreTask
//
//  Created by Gado on 26/08/2022.
//

import UIKit

class ProductsViewController: UIViewController {
    
    // MARK: - Outlets
    
    
    @IBOutlet weak var productsTableView: UITableView!
    
    
    // MARK: - Properties
    
    private let viewModel = ProductViewModel()
    var cartProducts = [Product]()
    
    
    
    // MARK: - Override Functions
    // viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableConfiguration()
        viewModel.refreshProducts()
        viewModel.productsDidRefresh = { [weak self] in
            self?.productsTableView.reloadData()
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func cartButtonTapped(_ sender: Any) {
        navigateToCart()
    }
    
    
    // MARK: - Methods
    
    func tableConfiguration(){
        
        productsTableView.delegate = self
        productsTableView.dataSource  = self
        let nib = UINib(nibName: ProductTableViewCell.identifier, bundle: nil)
        productsTableView.register(nib, forCellReuseIdentifier: ProductTableViewCell.identifier)
    }
    
    func navigateToCart() {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "CartViewController") as! CartViewController
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
}

extension ProductsViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.identifier, for: indexPath) as! ProductTableViewCell
        cell.modify(product: viewModel.products[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.products[indexPath.row].date = Date()
        cartProducts.append(viewModel.products[indexPath.row])
        viewModel.saveToUserDefaults(of: cartProducts)
    }
    
}
