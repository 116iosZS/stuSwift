//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


// 闭包表达式   "闭包是自包含的函数代码块，可以在代码中被传递和使用"
let names = ["Chirs","Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1:String,  _ s2 : String) -> Bool{
    return s1 > s2
}
var reversedNames = names.sorted(by: backward)

// 闭包表达式语法
/*
 { (参数列表) -> 返回类型 in
        语句
 }
 */
let text =
"""
var reversedNames2 = names.sorted(by: {(s1:String, s2:String) -> Bool in
    return s1 > s2
})
"""
var reversedNames2 = names.sorted(by: {(s1:String, s2:String) -> Bool in
    return s1 > s2
})
print(text, reversedNames2,separator:" <<->> ")
print("内联 names.sorted(by: {(s1:String, s2:String) -> Bool in return s1 > s2}",names.sorted(by: {(s1:String, s2:String) -> Bool in return s1 > s2}),separator:" <<->> ")
// 根据上下文推断类型
print("上下文推断类型 names.sorted(by: {s1, s2 in return s1 > s2})", names.sorted(by: {s1, s2 in return s1 > s2}),separator:" <<->> " )
print("单表达式闭包隐式返回 names.sorted(by: {s1, s2 in s1 > s2})", names.sorted(by: {s1, s2 in s1 > s2}),separator:" <<->> " )

// 参数名称缩写  Swift 自动为内联闭包提供了参数名称缩写功能，你可以直接通过 $0，$1，$2 来顺序调用闭包的参数，以此类推
print("参数名称缩写 $0, $1, ...", names.sorted(by: { $0 > $1 } ), separator: " <<->> ")

// 运算符方法
print("运算符方法 names.sorted(by: >)",names.sorted(by: >),  separator: " <<->> ")

// 尾随闭包
"""
如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用。在使用尾随闭包时，你不用写出它的参数标签：

func someFunctionThatTakesAClosure(closure: () -> Void) {
// 函数体部分
}

// 以下是不使用尾随闭包进行函数调用
someFunctionThatTakesAClosure(closure: {
// 闭包主体部分
})

// 以下是使用尾随闭包进行函数调用
someFunctionThatTakesAClosure() {
// 闭包主体部分
}
"""


// 值捕获
"""
闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值
"""
func makeIncrementer(forIncrement amount:Int) -> ()->Int{
    var runningTotal = 0
    func incrementer() -> Int{
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
var step1 = makeIncrementer(forIncrement: 1)
var step3 = makeIncrementer(forIncrement: 3)
var step3Plus = step3
print("step1() = ", step1())
print("step1() = ", step1())
print("step1() = ", step1())
print("step1() = ", step1())

print("step3() = ", step3())
print("step3() = ", step3())
print("step3() = ", step3())
print("step3() = ", step3())
print("step3Plus() = ", step3Plus())

//  逃逸闭包
"""
当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。

将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。比如说，在下面的代码中，传递到 someFunctionWithEscapingClosure(_:) 中的闭包是一个逃逸闭包，这意味着它需要显式地引用 self。相对的，传递到 someFunctionWithNonescapingClosure(_:) 中的闭包是一个非逃逸闭包，这意味着它可以隐式引用 self。
"""
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)
// 打印出 "200"

completionHandlers.first?()
print(instance.x)
// 打印出 "100"


// 自动闭包
"""
自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，用一个普通的表达式来代替显式的闭包
"""
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count) // 打印出 "5"
let customerProvider = { customersInLine.remove(at: 0) }
print(customersInLine.count) // 打印出 "5"
print("Now serving \(customerProvider())!") // Prints "Now serving Chris!"
print(customersInLine.count) // 打印出 "4"
// 自动闭包作为函数参数
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: { customersInLine.remove(at: 0) } ) // 打印出 "Now serving Alex!"

