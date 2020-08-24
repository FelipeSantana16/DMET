import UIKit

var dic = [Int: [String]]()



if dic[1] != nil {
    dic[1]?.append(contentsOf:["Mundo"])
} else {
    dic[1] = ["Olá"]
}

if dic[1] != nil {
    dic[1]?.append(contentsOf:["Mundo"])
} else {
    dic[1] = ["Olá"]
}


print(dic)
