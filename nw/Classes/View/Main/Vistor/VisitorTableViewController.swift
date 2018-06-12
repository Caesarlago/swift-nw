//
//  VisitorTableViewController.swift
//  nw
//
//  Created by HP on 2018/6/8.
//  Copyright © 2018年 HP. All rights reserved.
//

import UIKit

class VisitorTableViewController: UITableViewController {

    ///用户登录标记
    private var userLogon = false
    // 访客视图
    var visitorView: VisitorView?
    
    override func loadView() {
        // 根据用户登录情况，决定显示的根视图
        userLogon ? super.loadView() : setupVisitorView()
    }
    ///设置访客视图
    private func setupVisitorView(){
        // 替换根视图
        visitorView = VisitorView()
        view = visitorView
    }

}
