//
//  ViewController.swift
//  streatchyHeader
//
//  Created by Ahmed Eid on 06/04/2018.
//  Copyright © 2018 Ahmed Eid. All rights reserved.
//

import UIKit

class Home: UITableViewController {
  let nCell = "NORMAL__CELL"
  
  private var headerHeight = 200
  
  let container: UIView = {
    let v = UIView()
    v.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
    return v
  }()
  
  let img: UIImageView = {
    let i = UIImageView()
    i.contentMode = .scaleAspectFill
    i.image = #imageLiteral(resourceName: "bg-header")
    i.clipsToBounds = true
    return i
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  

  func setupViews(){
    tableView.register(NormalCell.self , forCellReuseIdentifier: nCell)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
//    tableView.rowHeight = UITableViewAutomaticDimension
    setupContainer()
  }
  
  func setupContainer(){
//    tableView.tableHeaderView = container

    tableView.addSubview(container)
    tableView.contentInset = UIEdgeInsets(top: CGFloat(headerHeight), left: 0, bottom: 0, right: 0)
    tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
    updateHeader()
    container.addSubview(img)
    
    img.anchorEdges(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, bottom: container.bottomAnchor)
  }
  
  func updateHeader(){
    var rect = CGRect(x: 0, y: -headerHeight, width: Int(view.bounds.width), height: headerHeight)
    
    if tableView.contentOffset.y  < CGFloat(-headerHeight) {
      let coy = tableView.contentOffset.y
      rect.origin.y = coy
      rect.size.height = -coy
    }
    
    container.frame = rect
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 25
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: nCell, for: indexPath) as! NormalCell
    cell.updateViews(header: "header", body: "body")
    return cell
  }
  

  override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//    return UITableViewAutomaticDimension
    return 60
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return UITableViewAutomaticDimension
    return 60
  }

  override var prefersStatusBarHidden: Bool {
    return true
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    updateHeader()
  }

}

