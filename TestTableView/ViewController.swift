//
//  ViewController.swift
//  TestTableView
//
//  Created by Vamsi on 27/01/20.
//  Copyright © 2020 iOSDevelopers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var names = ["Mahesh1","Mahesh2","Mahesh3","Mahesh4","Mahesh5","Mahesh6","Mahesh7","Mahesh8","Mahesh9","Mahesh10","Mahesh11"]
    @IBOutlet weak var tableView : UITableView?
    
    var selectedIndexPaths = [IndexPath]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedOnRefresh(_ sender : UIBarButtonItem) {
        
        var idx = 0
        tableView?.beginUpdates()
        for path in selectedIndexPaths {
            let itemtoMove = names[path.row]
            names.remove(at: path.row)
            names.insert(itemtoMove, at: idx)
            tableView?.moveRow(at: path, to: IndexPath(item: idx, section: 0))
            idx += 1
        }
          tableView?.endUpdates()
        selectedIndexPaths.removeAll()
    }
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = names[indexPath.row]
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPaths.append(indexPath)
    }
    
}
