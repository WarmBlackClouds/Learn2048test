//
//  ViewController.swift
//  Swift2048
//
//  Created by 许 振辉 on 16/12/15.
//  Copyright © 2016年 许 振辉. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //开始界面的按钮
    @IBAction func startGame(sender: AnyObject) {
        
        //1-UIAlertView方式
//        let alertView = UIAlertView()
//        alertView.title = "开始！"
//        alertView.message = "游戏就要开始了，准备好了吗？"
//        alertView.addButtonWithTitle("Ready Go!")
//        alertView.show()
        
        //1-UIAlertView方式 创建委托，实现对弹出框按钮事件的点击
        //        alertView.delegate = self
        
        
        //------------------------------------------------------------
        
        //2-UIAlertView方法已经过时了，现在用UIAlertController来代替，并在初始化的时候，preferredstyle参数的值设置为UIAlertControllerStyle.Alert
        let alertController = UIAlertController(title: "开始", message: "准备好了吗", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Ready Go!", style: UIAlertActionStyle.Default, handler: {
            action in
            self.presentViewController(MainTabViewController(), animated: true, completion: nil)
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
        
        
    }
    
    //1-UIAlertView方式
//    func alertView(alertView:UIAlertView,clickedButtonAtIndex buttonIndex:Int){
//        self.presentViewController(MainTabViewController(), animated: true, completion: nil)
//    }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

