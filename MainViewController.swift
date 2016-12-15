//
//  MainViewController.swift
//  Swift2048
//  MainTabViewController的第一个子类
//  Created by 许 振辉 on 16/12/15.
//  Copyright © 2016年 许 振辉. All rights reserved.
//  4X4的方格地图，使用UIView来绘制，每一个背景块是一个50像素X50像素大小的方块

import UIKit

class MainViewController: UIViewController {

    //游戏方格维度
    var dimension:Int = 4
    
    //游戏过关最大值
    var maxnumber:Int = 2048
    
    //数字格子的宽度
    var width:CGFloat = 50
    
    //格子与格子的间距
    var padding:CGFloat = 6
    
    //保存背景图数据
    var backgrounds:Array<UIView>!
    
    init(){
        self.backgrounds = Array<UIView>()
        super.init(nibName:nil,bundle:nil)
    }
    
    required init(coder aDecoder:NSCoder){
        super.init(coder:aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 改成主视图背景白色背景
        self.view.backgroundColor = UIColor.whiteColor()
        setupGameMap()
    }

    func setupGameMap(){
        var x:CGFloat = 50
        var y:CGFloat = 150
        
        for i in 0..<dimension{
            print(i)
            y = 150
            for j in 0..<dimension{
                //初始化视图
                var background = UIView(frame: CGRectMake(x,y,width,width))
                background.backgroundColor = UIColor.darkGrayColor()
                
                self.view.addSubview(background)
                //将试图保存起来，以后备用
                backgrounds.append(background)
                y += padding+width
            }
            x += padding+width
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
