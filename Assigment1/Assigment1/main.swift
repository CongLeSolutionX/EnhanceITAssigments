//
//  main.swift
//  Assigment1
//  Swift version

//  Created by Cong Le on 1/23/20.
//  Copyright © 2020 Enhance IT. All rights reserved.
//



import Foundation

// MARK: Array - an ordered, random-access collection
// DECLARING THE ARRAY

// An array of 'Int' elements
let evenNUmbers = [2,4,6,8,10,12,14]

// creating an array containing the elements of a sequence
let numbers = Array(7...15)
print(numbers)
//[7, 8, 9, 10, 11, 12, 13, 14, 15]

// An array of 'String' elements
var states = ["California","Georgia", "Alabama", "Texas"]
print(states)
// ["California","Georgia", "Alabama", "Texas"]

// a shoterned form of a array of Double elements
var emptyDoubles: [Double] = []
var empty: [Int] = []
// a full type name of an array of Float elements
var emptyFloats: Array<Float> = Array()
var emptyInts = Array<Int>()

// an array with preinitialized with a fixed number of default values, using:
// Array(repeating: count: ) initializer
var digitCounts = Array(repeating: 1, count: 10)
print(digitCounts)
// [1,1,1,1,1,1,1,1,1,1]


// ADDING TO ARRAY, using
// append(_:) method -> adding the new elements to the end of the existing array
var states2 = states
states2.append("Alaska")
states2.append(contentsOf: ["Washington", "Hawaii"])
print(states2)
// ["California", "Georgia", "Alabama", "Texas", "Alaska", "Washinton", "Hawaii"]

// insert(_:at:) method -> inserting a single element at specific position to an existing array
var states3 = states2
states3.insert("Floria", at: 2)
print(states3)
//["California", "Georgia", "Floria","Alabama", "Texas", "Alaska", "Washinton", "Hawaii"]

// insert(contentsOf:at:) -> inserting multiple elements from another collection or array literal
var states4 = states3
states4.insert(contentsOf:["Oregon", "Seattle"], at: 4)
print(states4)
// ["California", "Georgia", "Floria", "Alabama", "Oregon", "Seattle","Texas", "Alaska", "Washinton", "Hawaii"]g

// REMOVE ELEMENTS FROM AN ARRAY, using
// remove(at:) method -> remove at specific position in the array
states4.remove(at: 4)
print(states4)
// ["California", "Georgia", "Floria", "Alabama", "Seattle","Texas", "Alaska", "Washington", "Hawaii"]
// removeSubrange(_:) method -> Removes the elements in the specified subrange from the collection
states4.removeSubrange(4..<8)
print(states4)
//["California", "Georgia", "Floria", "Alabama", "Hawaii"]

// removeLast() method
states4.removeLast()
print(states4)
// ["California", "Georgia", "Floria", "Alabama"]

// ACCESSING THE ARRAY

// iterate over the array
print("The following states are all in USA:")
for state in states {
    print("\(state)")
}
// check empty array
if states.isEmpty{
    print("I havent visited any states in USA.")
} else {
    print("I have visited \(states.count) states in the USA.")
}
// accessing 1st elements and last elements of the array
print("The first and last state that I've visited are: ")
if let firstState = states.first, let lastState = states.last {
    print(firstState, lastState, separator: ",")
}
//if properties are nill, then print nill
print(emptyDoubles.first as Any, emptyFloats.last as Any, separator: ",")

// subscript by index
print("I only live in \(states[0]).")
print("I haven't been in the following states:")
print(states[1],states[2], states[3], separator:",")

// accesses an contiguous subrange of the array's elements
let statesSlice = states4[3..<states4.endIndex]
print(statesSlice)
// ["Alabama", "Seattle", "Texas", "Alaska", "Washington", "Hawaii"]

// return the 1st index where the specified value appears in the array
if let index = states4.firstIndex(of: "California") {
    states4[index] = "Cali"
}
print(states4)
// ["Cali", "Georgia", "Floria", "Alabama"]


// MARK: Set
// Check if set contains element
let carBrands: Set<String> = ["Honda", "Audi", "Tesla", "Mercedes"]
if carBrands.contains("Tesla"){
    print("Sorry! It's too expensive")
}
//"Sorry! It's too expensive"



// MARK: All Primitives
// Due to Swift's type inference, we can declare primitive data as following
// Declare Integer
var intNum = 5

// Declare String
var word = "I'm a string!"

// Declare Boolean
var answer = false

// Declare Double
var doubleNum = 3.5

// Declare Float
var floatNum = 3.456775422345456775422345

// MARK: Dictionary
// Declaring a dictionary
var dictionary: [String: Int]
// declaring a dictionary with a dictionary literal (a list of key-value pairs)
var dict: [String: Int] = ["key1":1,
                           "key2":2,
                           "key3":3,
                           "key4":4,
                           "key5":5,
                           "key6":6,
                           "key7":7,
                           "key8":8,
                           "key9":9]

var employeeInfo: [String: String] = [
    "firstName" : "Cong",
    "lastName" : "Le",
    "jobTitle" : "iOS Developer"]

// declaring an empty dictionary using empty dictionary literal
var emptyDict: [Int: Int] = [:]

// Iterate over dictionary
for (key, value) in employeeInfo {
    print("\(key): \(value)")
}


// Get dictionary value from key
// unwrapping the optional using optional binding
if let keyTwo = dict["key2"]{
    print(keyTwo) // 2
}
// force to unwrap the optional value of the dictionary
print(dict["key7"]!)  // 7


// MARK: Function
// Return element from function
func sayHello() -> String {
    return "Hello there!"
}
print(sayHello()) // Hello there!

// Add parameters to function

func sayHowAreYou(name: String, alreadyGreeted: Bool) -> String{
    if alreadyGreeted{
        return "We have meet before"
    } else {
        return "Hi \(name)"
    }
}
print(sayHowAreYou(name: "Cong Le", alreadyGreeted: false)) // Hi Cong Le


// MARK: Protocols (or similar, like interface)
// Declare a protocol

protocol Vehicles{
    var type: String {get set }
    func moving()
  
}
// Default implementation for protocol function via a Protocol Extension
extension Vehicles{
    func moving(){
        print("\(type) can move from point A to point B")
    }
}
// MARK: Objects
// Create class
class Aircraft: Vehicles {
    var type: String
    var wheels: Bool
    
    init(type: String, wheels: Bool){
        self.type = type
        self.wheels = wheels
    }
  
}

let helicopter = Aircraft(type: "Helicopter", wheels: false)
print(helicopter.type) // Helicopter
print(helicopter.wheels) // false
helicopter.moving() // Helicopter can move from point A to point Bs

// Create struct
struct Car: Vehicles {
    var type: String
    var numberOfWheels: Int
}

let sedan = Car(type: "Sedan", numberOfWheels: 4)
print(sedan.type)  // Sedan
print(sedan.numberOfWheels) // 4
sedan.moving() // Sedan can move from point A to point B



// MARK: Enum (or similar)
// Declare enum
// Raw Value Enum
enum Airport: String {
    case munich = "MUC"
    case sanFran = "SFO"
    case la = "LAX"
}
// Associated Value Enum
enum Traffic{
    case car(Car)
    case aircraft(Aircraft)
}


// MARK: Declare property
// Declare Mutable

extension Car{
    mutating func running() {
        print("\(type) is running!")
    }
}
var hatchback = Car(type: "Hatchback", numberOfWheels: 4)
hatchback.running() // Hatchback is running

// Declare Immutable
struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    
}

extension Person {
    func age(age: Int) -> Person{
        return Person(firstName: firstName, lastName: lastName, age: age)
    }
}


// MARK: Explicit Declare Property
// Declare Character
let letterExplicit: Character = "L"

// Declare String
let wordExplicit: String = "I'm a string!"

// Declare Integer
let intExplicitNumber: Int = 5

// Declare Integer
let doubleExplicitNumber: Double = 5.12

// Declare Boolean
let answerExplicit: Bool = false



// MARK: Optionals
// Declare Optional
let potentialString: String? = "I might be an optional string."

// Force unwrap optional
let forcedString: String = potentialString! // contain the exclaimation mark at the end

// Declare property with nil coalescing

// Option 1
let valEmployeeInfo = employeeInfo["firstName"]
var unwrappedEmployee = valEmployeeInfo ?? "Anonymous"
print(unwrappedEmployee) // Cong
// Option 2
var valName: String? = nil
print(valName ?? "No name") // No name
// Option 3
print("Hello, \(valName ?? "Anonymous")!") // Hello, Anonymous!

// Use optional binding to safely unwrap (both ways)

if let myName = valEmployeeInfo {
    print(myName) // Cong
}

func printName(optional: String?) {
    guard let name = optional else {
        print("I dont have name")
        return // exit the scope (function )
    }
    print("Hello everyone, my name is \(name)")
}
printName(optional: "Cong Le") // Hello everyone, my name is Cong Le

// Use optional chaining to safely unwrap
let optionalCar: Car? = Car(type: "Minivan", numberOfWheels: 4)
let carType = optionalCar?.type
print(carType!) // Minivan

// Declare an Implicit unwrapped optional
let assumedString: String! = "This is an implicit unwrapped optional string."


// combination of optional bindings an boolean statements in if-else statement
// Option 1:
if let firstNum = Int("10"),let secondNum = Int("15"),firstNum < secondNum && firstNum > 2{
    print("\(firstNum)<\(secondNum) < 100")
} else {
    print("Your input is invalid")
} // 10<15 < 100

// Option 2:
if let firstNumber = Int("4"){
    if let secondNumber = Int("20"){
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
} // 10<15 < 100



// MARK: If, else statement
// Declare if else statement
if states.count > 5 {
    print("I have traveled to more than 5 states in the USA")
} else {
    print("I've traveled less than 5 states in America")
}
//"I've traveled less than 5 states in America"

// Declare ternary
var myState = states.contains("Miami") ? "true" : "false"
print(myState) // false
