import UIKit
import Foundation
var binaryPlusBaseString:String = ""
var binaryPlusReduceString:String = ""
var binaryMinusBaseString:String = ""
var binaryMinusReduceString:String = ""
var binaryOne:Double = 1
var binaryTwo:Double = 1
var binaryPlus = binaryOne + binaryTwo
var binaryMinus:Double = 0.0
var stringMinus:String = ""
if binaryOne >= binaryTwo {
    binaryMinus = binaryOne - binaryTwo
} else {
    binaryMinus = binaryTwo - binaryOne
    stringMinus = "-"
}
var binaryPlusArray = String(binaryPlus).characters.flatMap{Int64(String($0))}
var binaryPlusReduceArray = binaryPlusArray.dropFirst(Int(String(Int64(binaryPlus)).count))
binaryPlusReduceArray.reverse()
var newArrayCount = binaryPlusReduceArray.count + Int(String(Int64(binaryPlus)).count) - 1
for i in Int(String(Int64(binaryPlus)).count)...newArrayCount {
    if binaryPlusReduceArray[i] == 2 && i != newArrayCount {
    binaryPlusReduceArray[i] = 0
    binaryPlusReduceArray[i + 1] += 1
}
    if binaryPlusReduceArray[i] == 3 && i != newArrayCount {
    binaryPlusReduceArray[i] = 1
    binaryPlusReduceArray[i + 1] += 1
}
}
var binaryPlusBaseArray = String(Int64(binaryPlus)).characters.flatMap{Int64(String($0))}
if binaryPlusReduceArray[newArrayCount] == 2 {
    binaryPlusBaseArray[binaryPlusBaseArray.count - 1] += 1
    binaryPlusReduceArray[newArrayCount] = 0
}
if binaryPlusReduceArray[newArrayCount] == 3 {
    binaryPlusBaseArray[binaryPlusBaseArray.count - 1] += 1
    binaryPlusReduceArray[newArrayCount] = 1
}
binaryPlusReduceArray.reverse()
binaryPlusBaseArray.reverse()
if binaryPlusBaseArray.count != 1 {
for i in 0...binaryPlusBaseArray.count - 2 {
    if binaryPlusBaseArray[i] == 2 {
        binaryPlusBaseArray[i] = 0
        binaryPlusBaseArray[i + 1] += 1
    }
    if binaryPlusBaseArray[i] == 3 {
        binaryPlusBaseArray[i] = 1
        binaryPlusBaseArray[i + 1] += 1
    }
  }
}
if binaryPlusBaseArray[binaryPlusBaseArray.count - 1] == 2 {
    binaryPlusBaseArray[binaryPlusBaseArray.count - 1] = 0
    binaryPlusBaseArray.append(1)
}
if binaryPlusBaseArray[binaryPlusBaseArray.count - 1] == 3 {
    binaryPlusBaseArray[binaryPlusBaseArray.count - 1] = 1
    binaryPlusBaseArray.append(1)
}
binaryPlusBaseArray.reverse()
binaryPlusBaseString = binaryPlusBaseArray.flatMap{String($0)}.joined()
binaryPlusReduceString = binaryPlusReduceArray.flatMap{String($0)}.joined()
print("сложение  \(binaryPlusBaseString).\(binaryPlusReduceString)")
var binaryMinusArray = String(binaryMinus).characters.flatMap{Int64(String($0))}
var binaryMinusBaseArray = String(Int64(binaryMinus)).characters.flatMap{Int64(String($0))}
var binaryMinusReduceArray = binaryMinusArray.dropFirst(Int(String(Int64(binaryMinus)).count))
for i in 0...binaryMinusBaseArray.count - 1 {
    if binaryMinusBaseArray[i] == 8 {
       binaryMinusBaseArray[i] = 0
    }
    if binaryMinusBaseArray[i] == 9 {
       binaryMinusBaseArray[i] = 1
    }
}
if binaryMinusBaseArray[0] == 0 {
   binaryMinusBaseString = binaryMinusBaseArray.dropFirst().flatMap{String($0)}.joined()
} else {
   binaryMinusBaseString = binaryMinusBaseArray.flatMap{String($0)}.joined()
}
var newArrayCount2 = binaryMinusReduceArray.count + Int(String(Int64(binaryMinus)).count) - 1
for i in Int(String(Int64(binaryMinus)).count)...newArrayCount2 {
    if  binaryMinusReduceArray[i] == 8 {
        binaryMinusReduceArray[i] = 0
    }
    if binaryMinusReduceArray[i] == 9 {
        binaryMinusReduceArray[i] = 1
    }
}
binaryMinusReduceString = binaryMinusReduceArray.flatMap{String($0)}.joined()
print("вычитание \(stringMinus)\(binaryMinusBaseString).\(binaryMinusReduceString)")


