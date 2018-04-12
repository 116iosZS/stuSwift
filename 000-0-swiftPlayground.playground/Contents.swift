//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
print(str)


// 1.常量和变量
let maximumNumberOfLoginAttempts = 10   // let 常量
var currentLoginAttempt = 0             // var 变量
var x = 0.0, y = 0.0, z = 0.0

// 类型标注
var welcomeMessage:String
welcomeMessage = "Hello"
var red, green, blue:Double

let π = 3.1415926
let 你好 = "世界"
let 🐩 = "dog"

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour!"

let languageName = "Swift"
// languageName = "Swift++"  // 常量不能改变值

print("\(friendlyWelcome) \(languageName)")
print("测试",  separator: "-",terminator: " ")
print("测试2")


// 整数
let minUInt8Value = UInt8.min
let maxUInt8Value = UInt8.max

let minIntValue = Int.min
let maxIntValue = Int.max
let minInt32Value = Int32.min
let maxInt32Value = Int32.max
let minInt64Value = Int64.min
let maxInt64Value = Int64.max

let floatValue:Float = 985.100190001
let doubleValue:Double = 123.45612356789123213211141412421424

let binaryValue = 0b10001

print(Int(-3.9))

// 别名
typealias AutoSimple = UInt
let aliasTest = AutoSimple.min

let lineBreaks = """

This string starts with a line break.
It also ends with a line break.

"""
