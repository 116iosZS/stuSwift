//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// 继承
// 1. swift 没有默认的基类
// 2. override 为重写关键字
// 3. 可以重写继承来得实例属性或类型属性,提供自己定制的 getter 和 setter，或添加属性观察器使重写的属性可以观察属性值什么时候发生改变
// 4. 防止重写 关键字 final
"""
你可以通过把方法，属性或下标标记为final来防止它们被重写，只需要在声明关键字前加上final修饰符即可（例如：final var，final func，final class func，以及final subscript）。

如果你重写了带有final标记的方法，属性或下标，在编译时会报错。在类扩展中的方法，属性或下标也可以在扩展的定义里标记为 final 的。

你可以通过在关键字class前添加final修饰符（final class）来将整个类标记为 final 的。这样的类是不可被继承的，试图继承这样的类会导致编译报错
"""


class Vehicle{
    var currentSpeed = 0.0
    var description: String{
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise()->String{
        return "什么都没做"
    }
}
var vehicle:Vehicle!
print(vehicle)
vehicle = Vehicle()
vehicle.currentSpeed = 120.0
print(vehicle.description)
var noise =
print(vehicle.makeNoise())
class Bicycle:Vehicle{
    var hasBasket = false
    override func makeNoise() -> String{
        return "自行车:铃铃铃"
    }
}
var bicycle = Bicycle()
bicycle.currentSpeed = 15
print(bicycle.description)
vehicle = bicycle
print(vehicle.makeNoise())

// 重写属性
class Car:Vehicle{
    var gear = 1
    override var description: String{
        return super.description + " in gear \(gear)"
    }
}
// 重写属性观察器
class AutomaticCar : Car{
    override var currentSpeed: Double{
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}
