//  使用一维数组模型

import Foundation

class GameModel {
    var dimension:Int = 0
    
    var tiles:Array<Int>
    
    //由外部来传入维度值
    init(dimension:Int){
        self.dimension = dimension
        
        self.tiles = Array<Int>(count: self.dimension*self.dimension, repeatedValue: 0)
        
    }
    
    //找出空位
    func emptyPositions()->[Int]{
        var emptytiles = Array<Int>()
        for i in 0..<(dimension*dimension){
            if(tiles[i] == 0){
                emptytiles.append(i)
            }
        }
        return emptytiles
    }
    
    //位置是否已满
    func isFull()->Bool{
        if(emptyPositions().count == 0){
            return true
        }
        return false
    }
    
    //输出当前数据模型
    func printTiles(){
        print(tiles)
        print("输出数据模型")
        var count = tiles.count
        for var i = 0 ; i<count; i++ {
            if(i+1) % Int(dimension) == 0{
                print(tiles)
            }else{
                print("\(tiles[i])\t")
            }
        }
        print("")
    }
}
