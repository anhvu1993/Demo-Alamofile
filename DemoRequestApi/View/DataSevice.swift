//
//  DataSevice.swift
//  DemoRequestApi
//
//  Created by Bui Van Tuan on 7/1/19.
//  Copyright © 2019 Bui Van Tuan. All rights reserved.
//

import UIKit
import Alamofire

//class DataService {
//    static let shared = DataService()
//
//    func getdata(comletHand: @escaping ([Versiondetails]) -> ()) {
//        guard let url = URL(string: urlApi) else {return}
//        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
//            guard error == nil else {return}
//            guard (reponse as? HTTPURLResponse)?.statusCode == 200 else {return}
//            guard let data = data else {return}
//            do {
//                let pokes = try? JSONDecoder().decode(Poke.self, from: data)
//                let datad = pokes?.helditems
//                print(datad)
//                DispatchQueue.main.async {
//                    var versiondetails = [Versiondetails]()
//                    for item in datad! {
//                        versiondetails = item.versiondetails
//                    }
//                    comletHand(versiondetails)
//
//                }
//            } catch {
//            print(error.localizedDescription)
//            }
//        }.resume()
//    }
//}

class DataService {
    
    static let shared = DataService()
    
    func getdata(comletHand: @escaping ([Versiondetails]) -> ()) {
        guard let url = URL(string: urlApi) else {return}
        Alamofire.request(url, method: .get, parameters:nil, encoding: JSONEncoding.default).responseJSON { response in
            //            print(response.data)
            do {
                let poke = try? JSONDecoder().decode(Poke.self, from: response.data!)
                let pokes = poke?.helditems
                DispatchQueue.main.async {
                    var versiondetails = [Versiondetails]()
                    pokes?.map{versiondetails = $0.versiondetails}
                    comletHand(versiondetails)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}


