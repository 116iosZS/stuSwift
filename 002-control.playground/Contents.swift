import Cocoa

var str = "Hello, playground"


// for-in
let names = ["Anna", "Alex", "Brian", "Jack"]       // 数组
for name in names{
    print("Hello, \(name)!")
}
print("")
let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]  // 字典
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
print("")
for index in 1...5 {                                // 遍历数字范围
    print("\(index) times 5 is \(index * 5)")
}

let base = 3
let power = 10
var answer = 1
for _ in 1...power{
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
while square < finalSquare{
    diceRoll = Int(arc4random_uniform(6))+1     // 随机产生1-6的数
    square += diceRoll
    if square < board.count {
        square += board[square]
    }
    print(diceRoll)
}
print("Game Over")
print(board)
print(board.count)

// repeat while
var num = 0
repeat {
    num += 2
} while num < 5
print(num)

// switch
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}
/* 区间匹配 */
let approximateCount = Int(arc4random_uniform(1000))+1
let countedThings = "moons orbiting Saturn"
let naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount)(\(approximateCount)) \(countedThings).")
/* switch + 元组 */
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}
/* switch + 值绑定(value bindings) */
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
/* switch + where */
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
print()
/* switch 复合分配 */
let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

if #available(iOS 10){
    print("可用")
}
