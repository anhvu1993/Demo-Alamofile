//
//  ViewController.swift
//  DemoRequestApi
//
//  Created by Bui Van Tuan on 7/1/19.
//  Copyright © 2019 Bui Van Tuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listPoke = [Versiondetails]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDataPoke()
        
    }
    private func setupDataPoke() {
        DataService.shared.getdata { (data) in
            self.listPoke = data
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPoke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PokeTableViewCell else {
            return  UITableViewCell()
        }
       let dataPoke = listPoke[indexPath.row].version
        cell.name.text = dataPoke.name
        cell.url.text = dataPoke.url
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
