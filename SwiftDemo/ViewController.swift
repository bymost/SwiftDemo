//
//  ViewController.swift
//  SwiftDemo
//
//  Created by bymost on 2017/8/29.
//  Copyright © 2017年 zlzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let testArray = ["1", "1", "2", "3"]
    let testString = "SwiftDemo"
    
    var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let filter = testArray.filterDuplicates({$0})
        print("数组过滤：\(filter)")
        
        let md5 = testString.subString(start: 3, length: -1).MD5
        print("MD5加密：\(md5)")
        
        tableView = UITableView.init(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib.init(nibName: TestTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: TestTableViewCell.reuseIdentifier)
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestTableViewCell.reuseIdentifier) as! TestTableViewCell
        return cell
    }
}
