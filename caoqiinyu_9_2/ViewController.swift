//
//  ViewController.swift
//  caoqiinyu_9_2
//
//  Created by student on 2018/11/24.
//  Copyright © 2018年 2016110302. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var v: UIView!
    var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = "Test"
        self.view.backgroundColor = UIColor.white
        //定义标签
        label = UILabel(frame: CGRect(x: 0, y: 300, width: self.view.bounds.width, height: 70))
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        self.view.addSubview(label)
        //定义view
        v = UIView(frame: CGRect(x: 200, y: 100, width: 100, height: 100))
        v.backgroundColor = UIColor.black
        self.view.addSubview(v)
        
        let rightBtn = UIBarButtonItem(title: "Alert", style: .plain, target: self, action: #selector(alertLogin))
        //将alert添加到导航栏右边
        self.navigationItem.rightBarButtonItem = rightBtn
        
        let leftBtn = UIBarButtonItem(title: "Action", style: .plain, target: self, action: #selector(actionSheet))
        //将action添加到导航栏左边
        self.navigationItem.leftBarButtonItem = leftBtn
       
    }
    @objc func alertLogin() {
        let alert = UIAlertController(title: "填写信息", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in
            tf.placeholder = "用户名"
        }
        alert.addTextField { (tf) in
            tf.placeholder = "密码"
        }
        //取消确定按钮
        let OKBtn = UIAlertAction(title: "确定", style: .default) { _ in
            //获取文本框文本
            let username = alert.textFields![0].text ?? ""
            let passwd = alert.textFields![1].text ?? ""
            let string = "用户名: \(username)\n密码: \(passwd)"
            self.label.text = string
        }
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        alert.addAction(OKBtn)
        alert.addAction(cancelBtn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func actionSheet() {
        let action = UIAlertController(title: "选择颜色", message: nil, preferredStyle: .actionSheet)
        
        let redBtn = UIAlertAction(title: "红色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.red
        }
        let greenBtn = UIAlertAction(title: "绿色", style: .default) { (_) in
            self.v.backgroundColor = UIColor.green
        }
        let cancelBtn = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        action.addAction(redBtn)
        action.addAction(greenBtn)
        action.addAction(cancelBtn)
        
        self.present(action, animated: true, completion: nil)
    }
  

}

