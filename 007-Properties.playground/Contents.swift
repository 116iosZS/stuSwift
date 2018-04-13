//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 存储属性
struct FixedLengthRange{
    var firstValue:Int
    let length:Int      // let 常量在构造的时候赋值
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 1, length: 3)
print(rangeOfThreeItems.firstValue,rangeOfThreeItems.length)
rangeOfThreeItems.firstValue = 5
print(rangeOfThreeItems.firstValue,rangeOfThreeItems.length)
//rangeOfThreeItems.length = 5
//print(rangeOfThreeItems.firstValue,rangeOfThreeItems.length)

// 延迟存储属性  关键字lazy  延迟存储属性必须为var 不能为let

// struct 为值类型 class 为引用类型

// 计算属性
struct Point{
    var x = 0.0, y = 0.0
}
struct Size{
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + size.width/2
            let centerY = origin.y + size.height/2
            return Point(x: centerX, y: centerY)
        }
        set {       // 如果没有定义新值得参数名, 则默认名称为newValue
            origin.x = newValue.x - size.width/2
            origin.y = newValue.y - size.height/2
        }
//        set(newCenter) {
//            origin.x = newCenter.x - size.width/2
//            origin.y = newCenter.y - size.height/2
//        }
    }
}
var square = Rect(origin: Point(x:0.0,y:0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
print("origin center is now at (\(initialSquareCenter.x), \(initialSquareCenter.y))")
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

// 只读计算属性
struct Cuboid{
    var width = 0.0, height = 0.0, depth = 0.0
    var volume:Double{      // 只读计算属性可以省略get关键字和大括号
        return width*height*depth
    }
}

// 属性观察器  willSet didSet  属性观察器不能与Set属性并存
class StepCounter{
    var totalSteps : Int = 0 {
//        willSet{
//            print("About to set totalSteps to \(newValue)")
//        }
//        didSet {
//            if totalSteps > oldValue {
//                print("Add \(totalSteps - oldValue) steps")
//            }
//        }
        willSet (newTotalSteps){
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet (oldTotalSteps){
            if totalSteps > oldTotalSteps {
                print("Add \(totalSteps - oldTotalSteps) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 960

// 全局变量和局部变量
"""
计算属性和属性观察器所描述的功能也可以用于全局变量和局部变量。全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量
"""

var testGlobal:Int = 0 {
    willSet (newTestGlobal){
        print("新值:\(newTestGlobal)")
    }
    didSet (oldTestGlobal){
        print("旧值:\(oldTestGlobal)")
    }
}

testGlobal = 10

// 类型属性(类属性 静态属性 static 不能通过实例访问)  实例属性(实例独自的属性)
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

