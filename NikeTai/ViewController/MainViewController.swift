//
//  ViewController.swift
//  NikeTai
//
//  Created by mac on 7/24/19.
//  Copyright © 2019 mac. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let tableView = UITableView()
    
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupMainViews()
        
        
    }
    
    
    
    //MARK: Main VC Setup
    
    private func setupMainViews() {
        
        viewModel.get()
        viewModel.delegate = self
        
        tableView.frame = UIScreen.main.bounds
        tableView.setupToFill(superView: view)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.register(AlbumTableCell.self, forCellReuseIdentifier: AlbumTableCell.identifier)
        
    }
    

}

//MARK: TableView
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.albums.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableCell.identifier, for: indexPath) as! AlbumTableCell
        
        let album = viewModel.albums[indexPath.row]
        cell.album = album
        
        return cell
    }
    
    
}


extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let album = viewModel.albums[indexPath.row]
        viewModel.currentAlbum = album
        let detailVC = DetailViewController()
        detailVC.viewModel = viewModel
        
        detailVC.hidesBottomBarWhenPushed = true
        navigationController?.view.backgroundColor = .white
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
}

//MARK: ViewModelDelegate
extension MainViewController: ViewModelDelegate {
    
    
    func updateView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    
}
