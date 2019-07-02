//
//  ViewController.swift
//  DemoRequestApi
//
//  Created by Bui Van Tuan on 7/1/19.
//  Copyright © 2019 Bui Van Tuan. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    var listPoke = [Versiondetails]()
    var imageUrl = ["http://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-6_044127357.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg","http://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-6_044127357.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg","http://thuthuatphanmem.vn/uploads/2018/09/11/hinh-anh-dep-6_044127357.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg", "http://i2.taimienphi.vn/tmp/cf/images/2018/download/hinh-anh-dep-3.jpg"]
    
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
        let dataImage = imageUrl[indexPath.row]
        cell.name.text = dataPoke.name
        cell.url.text = dataPoke.url
        cell.logo?.sd_setImage(with: URL(string: dataImage), placeholderImage: #imageLiteral(resourceName: "12"), options: [.continueInBackground, .progressiveLoad])
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
