
import Foundation

struct Matrix {
    let rows:Int ,columns:Int
    var grid:[Int]
    init(rows:Int,columns:Int){
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0)
    }
    
    func indexIsValidForRow(row:Int ,column:Int)->Bool{
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    
    subscript(row:Int,column:Int)->Int{
        get{
            assert(indexIsValidForRow(row, column: column),"超出范围")
            return grid[(row * columns) + column]
        }
        set{
            assert(indexIsValidForRow(row, column: column),"超出范围")
            grid[(row * columns) + column] = newValue
        }
    }
}

class GameModelMatrix {
    var dimension:Int = 0
    var tiles:Matrix
    
    //由外部来传入维度值
    init(dimension:Int){
        self.dimension = dimension
        
        self.tiles = Matrix(rows: self.dimension, columns: self.dimension)
        
    }
    
    //找出空位
    func emptyPositions()->[Int]{
        var emptytiles = Array<Int>()
        for row in 0..<(self.dimension){
            for col in 0..<(self.dimension){
                var val = tiles[row,col]
                if(val == 0){
                    emptytiles.append(tiles[row,col])
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
        for row in 0..<self.dimension {
            for col in 0..<self.dimension{
                print("\(tiles[row,col])\t")
            }
            print("")
        }
        print("")
    }
}
