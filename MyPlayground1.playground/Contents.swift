import UIKit

var myv = 432
myv = 245
let constant: Double = 23

let cc: Float = 4

let label = "the width is"
let width = 94
let widthlbl = label + String(width)


let app: Double = 3
let org: Double = 5
let asum = "my name"
let fruitSummary = "i have \(app + org) pieces of fruit and my name is \(asum)"

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[0] = "carret"

var dicttt = [
    "malcom" : "caption",
    "tom" : "abc"
]
dicttt["jane"] = "woman"

print(shoppingList)
print(dicttt)


let emptyArr: [String] = []
let emptyDic = Dictionary<String, Float>()

shoppingList = []

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else{
        teamScore += 1
    }
}

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "john Appleseed"
optionalName = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "bye"
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegeComment = "add some rain"
case "cucumber", "water":
    let vegeComment = "this is good tea"
case let x where x.hasSuffix("pepper"):
    let vegeComment = "Is it a spicy \(x)?"
case let x where x.hasPrefix("red"):
    let vegeComment = "is it red?"
default:
    let vegeComment = "everything tastes good in soup"
}

let interestingNumbers = [
    "Prime": [2,3,5,7,11,13],
    "Fibonacci": [1,1,2,3,5,8],
    "Square": [1,4,9,16,25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
largest

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m*2
} while m < 100
m

var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
firstForLoop

//var secForLoop = 0
//for var i = 0; i<3; ++i{
//    secForLoop += i
//}
//secForLoop

func greet(name: String, day: String) -> String {
    return "hello \(name), today is \(day)."
}
greet(name:"bob", day: "Monday")

func getGasPrices() -> (Double, Double, Double) {
    return (4.3, 5.6, 7.8)
}
getGasPrices()


func sumOf(numbers: Int...) -> Int{
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 34, 56)

func avgof(numbers: Int...) -> Int {
    var sum = 0, avg = 0;
    for number in numbers {
        sum += number
    }
    avg = sum / numbers.count
    return avg
}
avgof(numbers: 34, 35, 36)

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

func makeIncrementer() -> (Int) -> Int{
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}

func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)


numbers.map({
    (number: Int) -> Int in
    if number % 2 == 1 {
        return 0
    }
    return number
})

numbers.map({ number in 3 * number })

class Shape {
    var numberofSides = 0
    func sipleDesc() -> String {
        return "A shape with \(numberofSides) sides"
    }
}

var shape = Shape()
shape.numberofSides = 8
var shapeDesc = shape.sipleDesc()
shapeDesc


class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String){
        self.name = name
    }
    func simpleDesc() -> String {
        return "A shape is \(numberOfSides)"
    }
}

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDesc() -> String {
        return "A Square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test Square")
test.area()
test.simpleDesc()

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String){
        self.radius = radius
        super.init(name: name)
    }
    
    func area() -> Double {
        return radius * radius * 3.14
    }
    
    override func simpleDesc() -> String {
        return "A Circle with raidus of length \(radius)"
    }
    
    var perimeter: Double {
        get{
            return 3.9 * radius
        }
        set{
            radius = newValue / 3.0
        }
    }
}
let cdc = Circle(radius: 3.4, name: "test Circle")
cdc.area()
cdc.simpleDesc()
cdc.perimeter
cdc.perimeter = 6.7
cdc.radius

var emptySet = Set<String>()
var emptySet2: Set<String> = ["hello", "world", "zedd"]

emptySet2.insert("ios")
print(emptySet2)

emptySet2.update(with: "swift")
print(emptySet2)

emptySet2.remove(at: emptySet2.firstIndex(of: "ios")!)
print(emptySet2)

emptySet2.removeAll()

var a :Set = ["hello", "world", "zedd"]
var b :Set = ["swift", "ios", "zedd"]
print(a.intersection(b))
print(a.symmetricDifference(b))
print(a.union(b))
print(a.subtracting(b))
print(b.subtracting(a))


let voidClosure: () -> Void = {
    print("ios alallalalal")
}

voidClosure()

var count = 0
let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()

count

var hello: () -> Void = { print("Hello")}
func runClosure(name aClosure: () -> Void){
    aClosure()
}
runClosure(name: hello)

func runclosure2(index: Int, name aClosure: () -> Void){
    aClosure()
}
runclosure2(index: 2){
    print("hi")
}

var numbers_arr = [4,5,6,7,8,3]
numbers_arr = numbers_arr.map { (value) -> Int in
    let newVal = value + 1
    return newVal
}

let digitNames = [
    0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]

let oddOrEvenArr = digitNames.map { (key, value) -> String in
    var str = ""
    if key % 2 == 0 {
        str = "\(value): Even"
    }else {
        str = "\(value): odd"
    }
    return str
}


