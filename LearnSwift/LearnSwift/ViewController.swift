//
//  ViewController.swift
//  LearnSwift
//
//  Created by 🐝小蜜蜂🐝 on 2020/6/15.
//  Copyright © 2020 🐝小蜜蜂🐝. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        self.view.backgroundColor = UIColor.red
        
        
        
        //demo1：数组的使用 - 数组的可变性
        
        var arrX = [6,6,6,6]
        
        var arrY = arrX
        
        arrY.append(7)
        
        arrX.append(8)
        
        print("打印数组Y:：\(arrY)")
        
        print("打印数组X::\(arrX)")
        
        
        //demo2:数组和可选值和for循环
        let demoArray = ["🌰","🍎","🍐","🍇","🥚","🌽","🌺","I"]
        
        for index in demoArray{
            
             print( "index 的值为 \(index)")
        }
        
        
        
        for index2 in demoArray.dropFirst(){
            //迭代除第1个元素外的数组元素
            
            print( "index2 的值为 \(index2)")

            
            
        }
        
        
        for index3 in demoArray.dropLast(5) {
            
           // 迭代除最后5个元素外的数组元素
            
            print( "index3 的值为 \(index3)")

        }
        
        
        //所有元素和其下标,print多个参数和数据
        for (index,obj) in demoArray.enumerated() {
            
            
            print("index:\(index)","obj:\(obj)")
            
        }
        
        
        
        //demo3:方法调用等
        xiaomifengtestSwiftFunc()
        
        //demo4:测试带参数和返回内容的方法
        self.view.addSubview(XMFTestAddView(type: "0"))
        
        //demo5：基本数据类型进行运算
        XMFOperate(a: 2)
        
        
        //demo6：guard的使用,guard语句当条件为false的时候才会执行{}里面的代码
        
        XMFTestGuard(age: 26)
        
        //demo7：Switch-case语句
        XMFTestSwitch(a: 56)
        
        //demo8:体验元组
        XMFTestYuanZu()
        
        
        //demo9：体验for循环
        XMFTestForAndWhile()
        
        
    }
    

}

//demo10：


//demo9：体验for循环
func XMFTestForAndWhile() -> Void {
    
    //for循环写法一：
    for i in 0..<10 {
        
        print("循环打印数据：\(i)")
    }
    
    
    var j = 0
    //for循环写法二：
    for _ in 0..<6 {
        
        print("循环打印数据j：\(j)")
        
        j+=1
    }
    
    //for循环写法二等价于while
    
    var k = 0
    
    while k < 6 {
        
        print("while循环等价for的\(k)")
        
        k+=1
    }
    
    
    //repeat...while循环
    
    var l = 0
    
    repeat{
        
        print("repeat...while循环循环等价for的\(l)")
        
        l+=1
        
    }while l<6
    
    
    
}


//demo8:体验元组
func XMFTestYuanZu() -> Void {
    
    let mifeng = (age:30, height:177, name:"小蜜蜂🐝",interests:["篮球","读书","骑行",1])
    
    
    print(mifeng.age)
    print(mifeng.interests)
    print(mifeng.name)
    
    
    
    
    
    
}


//demo7：Switch-case语句
func XMFTestSwitch(a:Int) -> Void {
    switch a {
    case ..<60:
        print("不及格")
        
        //只要本case执行了，这个case后面紧接着的一个case也会执行
        fallthrough
        
    case 60..<80:
        print("合格")
    
    case 80..<90:
        print("良好")
    
        //注意：当a = 86的时候，只会走80..<90的条件，不会走90...100
        
    case 80...100:
        print("优秀")
        
    default:
        
        print()
    }
}



//demo6：guard的使用,guard语句当条件为false的时候才会执行{}里面的代码

func XMFTestGuard(age:Int) -> Void {
    
    guard age >= 18 else {
        
        print("未成年人不能上网")
        
        return
    }
    
    print("成年人可以上网")
}

//demo5：基本数据类型进行运算
func XMFOperate(a:Int) -> () {
    
    let a = 1
    
    let b = 2.2
    
    let c = a+Int(b)
    
    print("a和b相加后的结果：\(c)")
    
    
}


//demo4:方法2：测试带参数和返回内容的方法
func XMFTestAddView(type:String) -> UIView {
    
    //定义一个view
    let view:UIView = UIView()
    
    view.frame = CGRect(x: 1, y: 2, width: 30, height: 39)
    
    view.backgroundColor = UIColor.green
    
    
    let view2:UIView = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
    
    view2.backgroundColor = UIColor.red
    
    view2.addSubview(view)
    

    return view2
    
}

//demo3:方法1：测试方法的let和var的使用
func xiaomifengtestSwiftFunc()  {

    
    let a:Int = 2
    
    var b:Int = 3
    
    print("b的数值：\(b)")
    
    b = 4
    
    print("b赋值后的数值：\(b)")
    
    print("a的数值：\(a)")
    
    
    
}









