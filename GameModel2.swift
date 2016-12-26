
import Foundation

class GameModel2 {
    var dimension:Int = 0
    
    var tiles:Array<Array<Int>>
    
    //由外部来传入维度值
    init(dimension:Int){
        self.dimension = dimension
        
        self.tiles = Array(count: self.dimension, repeatedValue: Array(count: self.dimension*self.dimension, repeatedValue: 0))
        
    }
    
    //找出空位
    func emptyPositions()->[Int]{
        var emptytiles = Array<Int>()
        for row in 0..<(self.dimension){
            for col in 0..<(self.dimension){
                if(tiles[row][col] == 0){
                    emptytiles.append(tiles[row][col])
                }
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
        for row in 0..<self.dimension {
            for col in 0..<self.dimension{
                print("\(tiles[row][col])\t")
            }
            print("")
        }
        print("")
    }
}
