//: Playground - noun: a place where people can play

import UIKit


struct FractionToDecimal{
    
    /*func convertFractionToDecimal(numerator: Double, denominator: Double) -> String{
        var num = numerator;
        let den = denominator;
        
        if (num == 0){
            return "0"
        }
        var res = ((num > 0) || (den > 0)) ? "":"-"
        //Integral Part
        res.append(String(describing: Int(num/den)))
        print("Res 1: \(res)")
        num = num.truncatingRemainder(dividingBy: den)
        if (num == 0){
            return res;
        }
        
        //Fractional Part
        res.append(".")
        var map = Dictionary<Double, Int>()
        map[num] = res.count
        
        while num != 0 {
            num = num * 10;
            res.append(String(describing: Int(num/den)))
            print("Res 2: \(res)")
            num = num.truncatingRemainder(dividingBy: den)
            if (map[num] != nil){
                let index = map[num]
                res.insert("(", at: res.index(res.startIndex, offsetBy: index!))
                res.append(")")
                break
            }
            else{
                map[num] = res.count
            }
        }
        return res
    }*/
    
    
    func fractionToDecimal(numerator: Double, denominator: Double) -> String{
        var num = numerator;
        let den = denominator;
        
        var result = ""
        var dict = Dictionary<Int,Int>();
        if (num == 0 || den == 0){
            return "0"
        }
        result = String(describing: Int(num/den))
        if (num.truncatingRemainder(dividingBy: den) != 0){
            result.append(".")
        }
        
        while true {
            //print("Num: \(Int(num.truncatingRemainder(dividingBy: den)))")
            if (dict[Int(num.truncatingRemainder(dividingBy: den))] != nil){
                let index = dict[Int(num.truncatingRemainder(dividingBy: den))];
                result.insert("(", at: result.index(result.startIndex, offsetBy: index!))
                result.append(")")
                break
            }
            else{
                dict[Int(num.truncatingRemainder(dividingBy: den))] = result.count
                num = num.truncatingRemainder(dividingBy: den)*10
                result.append(String(describing:Int(num/den)))
               // print("Result: \(dict)")
            }
        }
        return result
    }
    
}
let fraction = FractionToDecimal()
print("Fraction: \(fraction.fractionToDecimal(numerator: 1.0, denominator: 5.0))")
//print("Fraction: \(fraction.convertFractionToDecimal(numerator: 23.0, denominator: 6.0))")

