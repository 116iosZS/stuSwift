//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// 下标
"""
下标可以定义在类、结构体和枚举中，是访问集合，列表或序列中元素的快捷方式。可以使用下标的索引，设置和获取值，而不需要再调用对应的存取方法。举例来说，用下标访问一个Array实例中的元素可以写作someArray[index]，访问Dictionary实例中的元素可以写作someDictionary[key]。

一个类型可以定义多个下标, 通过不同索引类型进行重载.下标不限于一维,你可以定义具有多个入参的下标满足自定义类型的需求
"""


// 下标语法
// 1. 下标允许你通过在实例名称后面的方括号中传入一个或者多个索引值来对实例进行存取
"""
subscript(index:Int)->Int{
    get {
        // 返回一个适当的Int类型的值
    }
    set (newValue){
        // 执行适当的赋值操作
    }
}
"""

struct TimesTable{
    let multiplier:Int
    // 这里只提供了 getter
    subscript(index:Int)-> Int{
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

// 下标选项
// 下标可以接受任意数量的入参，并且这些入参可以是任意类型。下标的返回值也可以是任意类型。下标可以使用变量参数和可变参数，但不能使用输入输出参数，也不能给参数设置默认值。
struct Matrix{
    let rows:Int, columns:Int
    var grid:[Double]
    init(rows:Int, columns:Int) {
//        assert((rows >=0 && columns >= 0), "行列不能为空")
        self.rows = rows
        self.columns = columns;
        grid = Array(repeating: 0.0, count: rows * columns)
    }
    func indexIsValid(row:Int, column:Int) -> Bool {
        return row>=0 && row < rows && column >= 0 && column < columns
    }
    subscript(row:Int,column:Int) ->Double{
        get{
            assert(indexIsValid(row: row, column: column), "下标越界")
            return grid[(row*columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "下标越界")
            grid[(row*columns) + column] = newValue
        }
    }
}
var matrix = Matrix(rows: 4, columns: 4)
print(matrix)
for item in 0...3{
//    matrix[item, item] = Double(item)
    matrix[item, item] = 1.0
}
print(matrix)
