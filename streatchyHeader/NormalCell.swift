import UIKit

class NormalCell: UITableViewCell {
  
  let container: UIView = {
    let v = UIView()
    return v
  }()

  let header: UILabel = {
    let l = UILabel()
    return l
  }()
  
  let body: UILabel = {
    let l = UILabel()
    
    return l
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    self.layoutMargins = .zero
    self.separatorInset = .zero
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupViews(){
    addSubview(container)
    container.addSubview(header)
    container.addSubview(body)
    
    container.anchorEdges(top: topAnchor, tConst: 8, left: leftAnchor, lConst: 8, right: rightAnchor, rConst: -8, bottom: bottomAnchor, bConst: -8)

    header.anchorEdges(top: container.topAnchor, left: container.leftAnchor, right: container.rightAnchor, bottom: nil)
    body.anchorEdges(top: header.bottomAnchor, tConst: 0, left: container.leftAnchor, lConst: 0, right: container.rightAnchor, rConst: 0, bottom: nil, bConst: 0)

  }
  
  func updateViews(header h: String?, body b: String?){
    header.text = h
    body.text = b
  }
}








































