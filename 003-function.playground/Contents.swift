//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


func greet(person:String) -> String{
    return "Hello, " + person + "!"
}
print(greet(person: "Carrot"))

// 无参函数
func fun1(){
    print ("无参数, 无返回值")
}
func fun2() ->String{
    return "无参数, 有返回值"
}
fun1()
print(fun2())
// 带参数的函数
func message(person:String, male:Bool) ->String{
    return "\(person)性别:" + (male ? "男" : "女")
}
print(message(person:"Susan", male:false))
// 多重返回值 返回元组
func minMax(array:[Int]) ->(min:Int, max:Int){
    var minvalue = Int.max, maxvalue = Int.min
    for value in array{
        minvalue = min(value, minvalue)
        maxvalue = max(value, maxvalue)
    }
    return (minvalue, maxvalue)
}
func minMax2(array:[Int]) ->(min:Int, max:Int)?{
    if array.isEmpty {return nil}
    var minvalue = Int.max, maxvalue = Int.min
    for value in array{
        minvalue = min(value, minvalue)
        maxvalue = max(value, maxvalue)
    }
    return (minvalue, maxvalue)
}
print(minMax(array: [13,5,9,-1,3,30,14]))
var tuple = minMax2(array:[])
// 参数名&参数标签   func test(参数标签 参数名:类型) -> 返回类型ß
func test(label1 param1:Int) -> String{
    return "label1 是参数标签, param1 是参数名=\(param1)"
}
print(test(label1: 12));
// 忽略参数标签
func someFunction1(_ firstParameterName: Int, secondParameterName: Int) {
    // 在函数体内，firstParameterName 和 secondParameterName 代表参数中的第一个和第二个参数值
    print("忽略了 第一个参数的标签")
}
someFunction1(1, secondParameterName: 2)
// 默认参数
func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果你在调用时候不传第二个参数，parameterWithDefault 会值为 12 传入到函数体中。
    print("parameterWithDefault = \(parameterWithDefault)")
}
someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6) // parameterWithDefault = 6
someFunction2(parameterWithoutDefault: 4) // parameterWithDefault = 12
// 可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)       // 返回 3.0, 是这 5 个数的平均数。
arithmeticMean(3, 8.25, 18.75)      // 返回 10.0, 是这 3 个数的平均数。
// 输入输出参数
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    a = a+b
    b = a-b
    a = a-b
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 函数类型 (Int, Int)->Int  相当于函数指针, 可以定义为变量, 可作为参数, 可以作为返回值
func addTwoInts(value1:Int, value2:Int)->Int{
    return value1 + value2
}
var funcType :(Int, Int) -> Int = addTwoInts
// 嵌套函数 可以被外围函数调用, 可以被外围函数当做返回值

