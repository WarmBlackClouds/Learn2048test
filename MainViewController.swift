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
        setupScoreLabels()
//        genNumber()
        for _ in 0..<17{
            genNumber()
        }
    }

    //让主视图可以调用绘制在祝地图上，
    func setupScoreLabels(){
        let score:ScoreVIew
        let bestscore:ScoreVIew
        score = ScoreVIew(stype: ScoreType.Common)
        score.frame.origin = CGPointMake(50,80)
        score.changeScore(value:0)
        self.view.addSubview(score)
        
        bestscore = ScoreVIew(stype:ScoreType.Best)
        bestscore.frame.origin.x = 170
        bestscore.frame.origin.y = 80
        bestscore.changeScore(value:0)
        self.view.addSubview(bestscore)
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
    

    //随机生成数字
    func genNumber(){
        //用于确定随机数的概率
        let randv = Int(arc4random_uniform(10))
        print(randv)
        var seed:Int = 2
        //因为有10%的机会出现1所以这里是10%的机会给4
        if(randv == 1){
            seed = 4
        }
        //随机生成行号和列号
        let col = Int(arc4random_uniform(UInt32(dimension)))
        let row = Int(arc4random_uniform(UInt32(dimension)))
        //执行后续操作
        let gmodel:GameModel? = nil //初始化前被使用时添加 ?=nil
        if((gmodel?.isFull()) != nil){
            print("位置已经满了")
            return
        }
        if(gmodel?.setPosition(row,col: col,value:seed) == false){
            genNumber()
            return
        }
        //----------
        insertTile((row,col),value:seed)
    }
    //数字插入
    func insertTile(pos:(Int,Int),value:Int)
    {
        let (row,col) = pos
        let x = 50 + CGFloat(col) * (width + padding)
        let y = 150 + CGFloat(row) * (width + padding)
        let tile = TileView(pos: CGPointMake(x,y), width: width, value: value)
        self.view.addSubview(tile)
        self.view.bringSubviewToFront(tile)
    }

}
