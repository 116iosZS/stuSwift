//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// 关键字 mutating static class @discardableResult

// 方法
// 1. 实例方法是属于某个特定类、结构体或者枚举类型实例的方法
// 2. 类型方法与类型本身相关联
class Counter{
    var count = 0
    func increment(){
        count += 1
    }
    func increment(by amount:Int){
        count += amount
    }
    func reset(){
        count = 0
    }
}
let counter = Counter()
counter.increment()
print(counter.count)
// self 属性

// 在实例方法中修改值类型
// 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改
// mutating 关键字, 可以改变值类型的属性不能在他的实例方法中修改的限定
struct Point{
    var x = 0.0, y = 0.0
    // 修改值类型的成员属性, 函数前必须加关键字mutating
    func moveBy(deltaX:Double, deltaY:Double){
//        x += deltaX
//        y += deltaY
        print("这里缺少mutating关键字, 不能修改x, y等属性")
    }
}

struct Point1{
    var x = 0.0, y = 0.0
    mutating func moveBy(deltaX:Double, deltaY:Double){
        x += deltaX
        y += deltaY
    }
    mutating func moveBy1(deltaX:Double, deltaY:Double){
        self = Point1(x: x+deltaX, y: y+deltaY)
    }
}

var pt = Point()
pt.moveBy(deltaX: 10, deltaY: 10)
print("pt = [\(pt.x),\(pt.y)]")
var pt1 = Point1()
pt1.moveBy(deltaX: 10, deltaY: 10)
print("pt1 = [\(pt1.x),\(pt1.y)]")
print(pt1)
pt1.moveBy1(deltaX: 0, deltaY: 0)
print(pt1)

// enum可变方法
enum TriStateSwitch {
    case Off, Low, High
    mutating func next(){
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
for item in 1...5{
    ovenLight.next()
    print(ovenLight)
}


// 类型方法 关键字 static, class (在func前添加static/class来定义类方法, class时表示可以允许子类重写)
class SuperClass{
    static var num:Int = 1
    var num:Int = 1
    static func unOverriedMethod(){
        print("这是一个不能重写的类型方法")
    }
    class func overriedAvaliableMethod(){
        print("这是一个能够重写的类型方法")
    }
}
class SubClass : SuperClass{
//    class func overriedAvaliableMethod(){
//        print("子类重写的方法")
//    }
}
print(SuperClass.unOverriedMethod())
print(SuperClass.overriedAvaliableMethod())
print(SubClass.overriedAvaliableMethod())
SuperClass.num = 2
var instance = SuperClass()
instance.num = 3
print(SuperClass.num, instance.num)

// 结构体(值类型)  类型方法
struct LevelTracker{
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level:Int){
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level:Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level:Int) -> Bool{
//        if LevelTracker.isUnlocked(level) {
//            currentLevel = level
//            return true
//        } else {
//            return false
//        }
        var res = LevelTracker.isUnlocked(level)
        currentLevel = res ? level : currentLevel
        return res
    }
}
class Player{
    var tracker = LevelTracker()
    let playerName : String
    func complete(level:Int){
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name:String){
        playerName = name
    }
}
var player = Player(name: "玩家1")
player.complete(level: 1)
print("玩家1最高的等级是: \(LevelTracker.highestUnlockedLevel)")
var player2 = Player(name: "玩家2")
if player2.tracker.advance(to: 6){
    print("玩家2当前的等级是:6")
} else {
    print("玩家2还没有解锁等级:6")
}

