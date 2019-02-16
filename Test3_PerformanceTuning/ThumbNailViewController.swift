//
//  ThumbNailViewController.swift
//  Test3_PerformanceTuning
//
//  Created by Lunar's Macbook Pro on 2/5/2561 BE.
//  Copyright © 2561 Lunar's Macbook Pro. All rights reserved.
//

import UIKit

class ThumbNailViewController: UITableViewController {

    @IBOutlet var thumbNailTableView: UITableView!
    let datasourceList: [String] = TestData.datasourceList
    
    var firstImageSrc: UIImage? = nil
    var secondImageSrc: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        thumbNailTableView.delegate = self
        thumbNailTableView.dataSource = self
        
        firstImageSrc = base64Image(imageString: datasourceList[0])
        secondImageSrc = base64Image(imageString: datasourceList[1])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ThumbNailCell
        cell.selectionStyle = .none
        cell.firstImageView.image = firstImageSrc
        cell.secondImageView.image = secondImageSrc
        return cell
    }
    
    func base64Image(imageString: String) -> UIImage?{
        if let data = Data(base64Encoded: imageString) {
            if let image = UIImage(data: data) {
                return image
            }
        }
        return nil
    }

}
