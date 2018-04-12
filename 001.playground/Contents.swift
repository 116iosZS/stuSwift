//: Playground - noun: a place where people can play


var str = "Hello, playground"
var name:String?

name = "Swift!!!"

print(str)
print(name)
print(
    """

这是第一行
    这里是缩进
这里又回来了
""")
print("WTF", terminator:"\n")

var someInts = [Int]()                                          // 创建一个空数组
someInts.append(3)
someInts = []
print("someInts is type [Int] with \(someInts.count) items.")

var threeDoubles = Array(repeating: 0.1, count: 3)              // 构造函数生成数组 带默认值
print(threeDoubles)
var anotherThreeDoubles = Array(repeating: 5.0, count: 3)
var sixItemsArray = threeDoubles + anotherThreeDoubles          // 两个数组 + 生成新数组
print(sixItemsArray)

var shoppingList:[String] = ["Eggs", "Milk"]                    // 字面量构造数组
var shoppingList2 = ["Eggs", "Milk"]
shoppingList2 += ["Baking Powder"]
shoppingList2 += ["Chocolate Spread", "Cheese", "Butter"]
/* shoppingList2[3] = "ssss"                   // 下标越界了*/
var valu1 = shoppingList2[2...4]
var autoArray = [1,3]

// Set
var letters = Set<Character>()
var letters2:Set<String> = ["Rock", "Classical", "Hip hop"]
var letters3:Set = ["Rock", "Classical", "Hip hop"]


var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

if favoriteGenres.isEmpty {
    print("没有数据")
} else {
    print("有\(favoriteGenres.count)个数据")
}

if let removedGenre = favoriteGenres.remove("Rock2"){
    print("\(removedGenre) 被移除了, 还剩\(favoriteGenres.count)个数据")
} else {
    print("没有找到合适的数据")
}

favoriteGenres.insert("Jazz")
if favoriteGenres.contains("Hip hop"){
    print("包含数据\"Hip hop\"")
} else {
    print("不包含数据\"Hip hop\"")
}

for item in favoriteGenres{
    print(item)
}

for item in favoriteGenres.sorted(){
    print(item)
}
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()        // 并集  a并b
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted() // 交际  a交b
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted() // a-b
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted() // (a并b) - (a交b)
// [1, 2, 9]

let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
// true
farmAnimals.isSuperset(of: houseAnimals)
// true
farmAnimals.isDisjoint(with: cityAnimals)
// true

//  字典
var namesOfIntegers = [Int: String]()    // 空字典
namesOfIntegers[16] = "sixteen"

var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]   // 字面量创建字典
print(airports.count)
print(airports["rrr"])
print(airports.count)
airports.updateValue("Beijing", forKey: "BJ")
print(airports.count)
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}
var airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)
