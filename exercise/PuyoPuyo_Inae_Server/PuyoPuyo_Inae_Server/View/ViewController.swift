//
//  ViewController.swift
//  PuyoPuyo_Inae_Server
//
//  Created by june on 2020/11/26.
//

import UIKit

class ViewController: UIViewController {
    
    var inaes: [Inae] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getFeeds()
        tableView.dataSource = self
    }
    
    func getFeeds() {
        ApiService.client.getFeed { (result) in
            switch (result) {
                case .success(let data):
                    if let datas = data as? [Inae] {
                        for item in datas {
                            self.inaes.append(item)
                        }
                    }
                case .pathErr:
                    print("path Err")
                case .requestErr(let msg):
                    print(msg)
                case .networkFail:
                    print("network Err")
                case .serverErr:
                    print("server Err")
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.setCell(inae: inaes[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inaes.count
    }
}
