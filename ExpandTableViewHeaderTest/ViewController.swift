//
//  ViewController.swift
//  ExpandTableViewHeaderTest
//
//  Created by zhaojian on 1/19/18.
//  Copyright © 2018 zhaojian. All rights reserved.
//

import UIKit

let image_height:CGFloat = 200.0

class ViewController: UIViewController {
    
    @IBOutlet weak var displayTable:UITableView!
    var topImageView:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImageView = UIImageView.init(frame: CGRect.init(x: 0, y: -200, width: UIScreen.main.bounds.size.width, height: image_height))
        topImageView.image = UIImage.init(named: "1.jpg")
        displayTable.addSubview(topImageView)
        
        topImageView.contentMode = .scaleAspectFill
        displayTable.contentInset = UIEdgeInsetsMake(image_height, 0, 0, 0)

        displayTable.register(UITableViewCell().classForCoder, forCellReuseIdentifier: "title")
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        if point.y < -image_height {
            var rect = topImageView.frame
            rect.origin.y = point.y
            rect.size.height = -point.y
            topImageView.frame  = rect
        }
    }
}


extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "title", for: indexPath)
        cell.textLabel?.text = "测试~"
        return cell
    }
    
    
}

