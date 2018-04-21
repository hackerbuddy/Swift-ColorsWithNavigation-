//
//  ColorsViewController.swift
//  Colors
//
//  Created by boborama on 4/11/18.
//  Copyright © 2018 hackerbuddy. All rights reserved.
//

import Foundation
import UIKit

class ColorsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var colorsTableView: UITableView!
    
    var colors = [Color(name: "red", color: UIColor.red),
                  Color(name: "orange", color: UIColor.orange),
                  Color(name: "yellow", color: UIColor.yellow),
                  Color(name: "green", color: UIColor.green),
                  Color(name: "blue", color: UIColor.blue),
                  Color(name: "purple", color: UIColor.purple),
                  Color(name: "brown", color: UIColor.brown)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Colors"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        cell.backgroundColor = color.color
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ColorDetailViewController,
            let row = colorsTableView.indexPathForSelectedRow?.row {
            //only if successful will we attempt to send color
            destination.color = colors[row]
        }
        
    }
}
