//
//  File.swift
//  
//
//  Created by dejaWorks on 03/06/2020.
//

import UIKit
import SnapKit

open class UITableViewControllerBuilder {
    
    public let tvc:UITableViewController
    
    public init(tvc:UITableViewController? = nil){
        if let tvc = tvc {
            self.tvc = tvc
        }else{
            self.tvc = UITableViewController()
        }
    }
    
    public func addTVC(on:UIViewController)->Self{
        on.addChild(tvc)
        tvc.didMove(toParent: on)
        return self
    }
    /// Add tableView on view
    public func addV(on:UIView)->Self{
        on.addSubview(tvc.tableView)
        return self
    }
    
    public func snapOnSuperView(inset:CGFloat = 0)->Self{
//        print("⚠️ Implement \(#function) in UITableViewControllerBuilder")
//        fatalError("SnapKit need here")
        tvc.tableView.snp.remakeConstraints { make in
            make.edges.equalToSuperview().inset(inset)
        }
        return self
    }
    
    public func register(cell:UITableViewCell.Type, with cellID:String)->Self{
        tvc.tableView.register(cell, forCellReuseIdentifier: cellID)
        return self
        
    }
    
    public func register(headerFooter:UITableViewHeaderFooterView.Type, with cellID:String)->Self{
        tvc.tableView.register(headerFooter, forHeaderFooterViewReuseIdentifier: cellID)
        return self
        
    }
    
    public func bgColor(_ color:UIColor)->Self{
        tvc.tableView.backgroundColor = color
        return self
        
    }
    public func build()->UITableViewController{
        return tvc
    }
}
