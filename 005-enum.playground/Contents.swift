//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

// 枚举语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 定义枚举变量1
var directionToHead = CompassPoint.east
// 定义枚举变量2
var directionToHead2:CompassPoint
directionToHead2 = .east;
print(directionToHead)

switch (directionToHead2){
case .north: print("北")
case .south: print("南")
case .east: print("东")
case .west: print("西")
}
// 强制穷举确保了枚举成员不会被意外遗漏 switch 中不需要穷举的必须添加default
let somePlanet = Planet.mars
switch somePlanet {
case .earth:  print("earth 是适合人类居住的星球")
default:  print("\(somePlanet) 不是适合人类居住的星球")
}

//
enum Barcode{
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
var productBarcode = Barcode.upc(1, 23, 43212, 9)
//productBarcode = Barcode.qrCode("ABCDETRADDS")
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// 简洁版
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case var .qrCode(productCode):
    print("QR code: \(productCode).")
}

// 枚举的原始值
enum EnumCharacter :Character{
    case tab = "\t"
    case lineFeed = "\n"
    case carriageRetur = "\r"
}
// 枚举原始值得隐式赋值 (venus 原始值默认为2)
enum Planet2 : Int{
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
// 通过rawValue 查看原始值
print("EnumCharacter = [\(EnumCharacter.tab.rawValue)]")
print("Planet2.venus.rawValue = [\(Planet2.venus.rawValue)]")

// 使用原始值初始化枚举实例
let possiblePlanet = Planet2(rawValue: 8)
print(possiblePlanet)

//! 递归枚举 关键字 indirect
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
// 递归枚举 使用
func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))
