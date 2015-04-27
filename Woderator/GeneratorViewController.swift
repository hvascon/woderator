//
//  GeneratorViewController.swift
//  Woderator
//
//  Created by Helen Vasconcelos on 4/21/15.
//  Copyright (c) 2015 Helen Vasconcelos. All rights reserved.
//

import UIKit

class GeneratorViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let options = ["Weekly", "Monthly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.edgesForExtendedLayout = .All;
        self.extendedLayoutIncludesOpaqueBars = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

// UITableView Delegates
extension GeneratorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let identifier = "Cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? UITableViewCell
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier)
        }
        
        cell!.textLabel!.text = self.options[indexPath.row]
        
        return cell!
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.options.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ReportViewControllerSegue", sender: self)
    }
}
