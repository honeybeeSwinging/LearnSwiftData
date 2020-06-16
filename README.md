# LearnSwiftData
项目是整理学习Swift相关的内容

目前进行的都是一些Swift的基础语法：

基础语法（一）

Swift语言是苹果公司在Apple WWDC 2014上退出的，用来撰写MacOS和iOS应用程序。

Swift在最初刚诞生的那三四年，极其不稳定，每一次升级都包含着大量的API变化。但是在Swift4.2以后就稳定多了，语法层面就几乎没什么变化了，主要是底层变化和新特性的增加。

苹果目前在大力推广Swift，Swift必将会替代OC，因为目前已经出现了Swift-Only的API——比如SwiftUI。

推荐一个学习网站：https://www.cnswift.org
该网站是对Swift官方文档的翻译，但不是无脑翻译，而是结合作者的开发经验，在翻译的基础上，给出一些实用的建议。

 在Swift中，语句结束可以不加分号。但是如果同一行有多个语句，仍然要加分号，不过我们不建议一行多句，我们提倡一行一句的代码风格。

在Swift中的打印语句是print
var str = "Hello, playground"
print(str)

在OC中，分组注释使用
#pragma mark - 
但是在Swift中，分组是使用
//MARK:-分组注释
其他的单行注释、多行注释与OC相同：
/* * 多行注释 */
// 单行注释
//MARK:-分组注释

常量与变量

什么是常量和变量

在Swift中规定，定义一个标识符的时候必须明确说明该标识符是常量还是变量：
使用let来定义常量，定义之后不可修改；
使用var来定义变量，定义之后可以修改。

let a: Int = 2
a = 3//会报错，因为a是常量，不可以修改
var b: Int = 6
b = 8//正常运行，b是变量，可以修改

声明为常量之后不可以修改的意思是，指针不可以再指向其他对象，但是可以通过指针拿到对象，修改其中的属性：

// 定义一个UIView
let view: UIView = UIView()


// 定义一个普通的UIView
let redView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

redView.backgroundColor = UIColor.red

view.addSubview(redView)

基本数据类型

Swift中的数据类型有整型、浮点型、Bool型、元组、枚举、结构体、对象类型等，其中，基本数据类型包括：整型、浮点型、Bool型

整型

有符号整型
Int8：有符号8位整型
Int16：有符号16位整型
Int32：有符号32位整型
Int64：有符号64位整型
Int：默认，和平台相关，相当于OC中的NSInteger

无符号整型
UInt8：无符号8位整型
UInt16：无符号16位整型
UInt32：无符号32位整型
UInt64：无符号64位整型
UInt：默认，和平台相关，相当于OC中的NSUInteger

浮点型

Float：32位浮点型
Double：64位浮点型（默认）

Bool型

true：真
false：假

基本数据类型的运算与OC是一样的：
a+b//加
a-b//减
a*b//乘
a/b//除
a%b//取余

但是需要注意的是，在Swift中，不同类型的数据是不可以运算的，比如整型和浮点型就不可以一块进行运算：

如果想要运算，那么就要将其中一种类型转为另一种类型：
var c = 1
var d = 1.1
Double(c)+d



Swift中的类型推导

Swift是一种强类型语言，也就是说，在Swift中，任何一个变量或者常量都必须有明确的类型。
var d: Int = 8

如果在定义一个标识符的时候有直接进行赋值，那么标识符后面 的类型可以省略：
var d = 8
因为Swift有类型推导，会自动根据后面的赋值来决定前面的标识符的数据类型。

我们可以通过option+鼠标左键来查看变量的数据类型：



需要注意的是，如果一个变量的类型已经确定了，那么就不可以再给变量赋其他类型的值：


这里的变量c已经是整型了，那么就只能给其赋整型值，不可赋其他类型的值。

日期类型

let date = Date()

运算符

计算运算符

+、-、*、/、%

需要特别注意的是，计算运算符两边的数据类型必须为同一类型，如果类型不同，则编译器会报错。

赋值运算符

=、+=、-=、*=、/=、%=

需要特别注意的是，赋值运算符两边的数据类型必须为同一类型，如果类型不同，则编译器会报错。

比较运算符

>、>=、<、<=、==、!=

需要特别注意的是，比较运算符两边的数据类型必须为同一类型，如果类型不同，则编译器会报错。

区间运算符

Swift特有的。
1...8//闭区间运算符，表示从1到8（包括1和8）的所有值的区间
1...//闭区间运算符，表示从1往后无限延伸
...8//闭区间运算符，表示从8往前无限延伸
1..<8//半开区间运算符，表示从1到8（包括1，但是不包括8）的所有值的区间
..<8//半开区间运算符，表示从8往前（不包括8）无限延伸

max/min

Int8.max//127
Int.max//9223372036854775807
Int16.min//-32768

与或非

&&，两真为真，一假则假
||，两家为假，一真则真
!，取反

元组

OC中没有元组类型，元组是Swift中特有的一种数据结构。
元组用于定义一组数据，组成元组的数据可以称为元素。

我们现在使用元组来描述一个人的信息：
var one = ("Norman", "male", 30, 178.5)
print(one.0)
然后摁住option键单击，发现变量one的类型如下：


这个类型是根据赋的值倒推出来的。

上面的元组one中的元素从左到右一次表示：名字、性别、年龄、身高。人们乍一看，其实还是不知道每个元素分别代表的意思的，所以为了便于理解，为了能够见文知意，我们还可以这样来定义元组：
//给元组中的元素加上名称，之后可以通过元素名称来访问元素
var one = (name:"Norman", gender:"male", age:30, height:178.5)print(one.name)
摁住option键单击，发现变量one的类型如下：



元组的简单使用

//写法一

let error = (404, "Not Found")

//下标访问

print(error.0)
print(error.1)


//写法二

let error = (errorCode:404, errorInfo:"Not Found")

//别名访问

print(error.errorCode)
print(error.errorInfo)

//写法三：定义元组变量，接收元组的值

let (errorCode, errorInfo) = (404, "Not Found")
print(errorCode)
print(errorInfo)

逻辑分支

分支的介绍

所谓的分支语句，就是if/switch/三目运算符等判断语句。
通过分支语句可以控制程序的执行流程。

if分支语句

Swift中的if语句和OC中的if语句还是有区别的：

区别1：Swift中判断句可以不加小括号()，但是判断之后的执行语句必须要用大括号{}括起来；OC中判断语句必须加小括号()，如果判断之后的执行语句只有一句话的话可以省略大括号{}。
let g = 8

if g>0 { 
   print("正数")
}

区别2：Swift的判断句中必须要有明确的真假，必须要有明确的布尔值，Swift中不再有非0即真的概念；OC中是非0即真、非空即真。



三目运算符

Swift中的三目运算与OC中保持了一致的风格。
let a = 10;
let b = 20;

//打印较大值

print(a > b ? a : b);

guard的使用

guard语句与if语句非常类似，但是与if语句不同的是，guard语句当条件为false的时候才会执行{}里面的代码。

guard语句必须带有else语句，他的语法如下：
• 当条件表达式为true的时候跳过else语句的内容，执行后面的语句组；
• 当条件表达式为false的时候执行else语句中的内容，跳转语句一般是return、break、continue或者throw

guard 条件表达式 else { 

 //当条件表达式不成立的时候执行的语句 

 break}

语句组

另外一个需要说明的点是，guard语句必须放在函数中。

func online(age : Int) -> Void {  

  guard age >= 18 else {
  
      print("未成年人不能上网")  

      return   

      }   

      print("可以上网")

}


online(age: 17)

Switch-case语句

switch作为选择语句中必不可少的语句也被加入到了Swift中。

首先看一个例子：
let a = 100


switch a {

case ..<60:   
    print("不及格")
case 60..<80:
    print("合格")
case 80..<90:
    print("良好")
case 90...100:
    print("优秀")
default:
    print("天才")
}


//一个case可以判断多个值，多个值以,隔开

let b = 0

switch b {
case 0,1:
    print("正常人")
default:
    print("其他")
}


//fallthrough关键字进行穿透

let c = 0

switch c {
case 0:
    fallthrough
case 1:
    print("正常人")
default:
    print("其他")
}



//

let d = 10
let e = 5
var result = 0

//switch是支持多种数据类型的

let opration = "+"

switch opration {

case "+":

    result = d + e

case "-":

    result = d - e

case "*":

    result = d * e

case "/":

    result = d / e

default:

    result = 0
}

Swift中的switch和OC中的switch用法基本一致，其不同点在于：
• Swift中的case后面的语句块执行完毕之后可以不跟break，因为默认会有break
• Swift中，一个case可以判断多个值，多个值以,隔开
• 如果希望出现之前的case穿透，则可以使用fallthrough关键字。所谓的穿透是指，当这个case满足的时候，执行完这个case所对应的内容之后，不会跳出，而是接着执行紧挨着的下一个case所对应的内容。
• 在Swift中，switch是支持多种数据类型的，不但支持整型、区间，还支持浮点型、字符串等。

基于以上几点，我们可以知道，Swift中的switch语句比其他语言中的switch语句要强大。

循环

在C/OC中，常见的循环有for/while/do-while；在Swift中，对应的循环有for/while/repeat-while。

For循环

for循环分为两种，一种是传统的C语言风格的for循环，如下：
for var i = 0; i < 10; i++ {
    print(i)
}
这种传统写法，在Swift3中已经被淘汰了，如下：



还有一种是for-in循环，如下：
for i in 0..<10 {
    print(i)
}

关于for-in循环，有一个特殊的地方需要注意：如果在某个循环中不需要用到下标i，那么使用下划线来代替下标，如下所示：
for _ in 0..<10 {
    print("Swift")
}
不然的话会有如下的警告⚠️：


while循环和repeat-while循环

//while循环（先判断，再执行）

var a = 0
while a < 10 {
    print(a)
    a+=1
}

//repeat-while循环（先执行一次，再判断）

var a = 0

repeat {
    print(a)
    a += 1}
 while a < 0

Swift中的repeat-while循环与OC中的do-while循环其实一模一样，都可以保证至少执行一次。

字符串

OC和Swift中的字符串是有区别的：
• 在OC中，字符串类型是NSString；在Swift中，字符串类型是String。
• OC中定义字符串是使用@""；Swift中定义字符串是使用""。

字符串的定义

//不可变字符串let str1 = "不可变字符串"
//可变字符串var str2 = "可变字符串"str2 = "我变变变"
//多行字符串var str3 = """多行字符串第一行第二行第三行第四行56"""

上面介绍了了几种传统的字符串定义形式，接下来我们来聊聊Swift5.0之后新推出的Raw String。
Raw String 是使用 # 来包裹字符串，其最大的特点就是：它不会对反斜杠\进行特殊的转义处理。
当字符串中含有双引号或者反斜杠转义符的时候，使用传统的方式定义如下：
let var1 = "如果句子中有双引号\"\"就会很尴尬"
//输出：如果句子中有双引号""就会很尴尬
let var2 = "如果句子中有转义字符\\就会很尴尬"
//输出：如果句子中有转义字符\就会很尴尬
使用Swift5.0新推出的RawString定义如下：
let var1 = #"如果句子中有双引号""就会很尴尬"#
let var2 = #"如果句子中有转义字符\就会很尴尬"#
如果字符串是被#包裹，那么 \ 是不需要转义的。
那如果字符串中有#，那怎么办呢？答案是使用两个井号##来包裹：
let var1 = ##"如果句子中有井号#"##
//打印结果：如果句子中有井号#

字符串的常用操作

//计算字符串的长度

let str = "12345678"
print(str.count)
print((str as NSString).length)

//拼接两个字符串
var str1 = "Norman" + "Lee"
var str2 = str1.appending("666")

//遍历字符串（字符串可以看成是多个字符的集合）
let str = "abcdefg"
for char in str {
    print(char)
}
//大写或者小写
let str = "abcdefg"
print(str.uppercased())//ABCDEFG

print(str.lowercased())//abcdefg


//字符串中是否包含某子字符串
let str = "abcdefg"
print(str.contains("abc")) //true
print(str.contains("A")) //false
print(str.contains("h")) //false


//分割字符串
let str = "abc&def&ghi&jkl&mn"
let desc = str.components(separatedBy: "&") // ["abc", "def", "ghi", "jkl", "mn"]

for item in desc {
    print(item)
}


//字符串替换
let str = "abc&def&ghi&jkl&mn"
let result = str.replacingOccurrences(of: "&", with: "---")
print(result) // abc---def---ghi---jkl---mn


//截取字符串
let str = "Hello Swift"
print(str.prefix(5)) // 取前5个字符
print(str.suffix(5)) // 取前5个字符


//截取字符串中第3个字符到第6个字符
let str = "Hello Swift"
let indexStart = str.index(str.startIndex, offsetBy: 2)
let indexEnd = str.index(str.startIndex, offsetBy: 5)
let subStr = str[indexStart...indexEnd] // "llo "//需要注意的是，截取字符串时候的索引必须是String.Index类型，不可以是数字类型。

数组

数组是一堆有序的由相同类型的元素构成的集合。
数组中的元素是有序的，可以重复出现。
Swift用Array表示数组，它是一个泛型集合。

数组的初始化

数组分为可变数组和不可变数组：
//定义一个可变数组
var arrar1 : [String] = [String]() //此时定义的是一个空数组

//定义一个不可变数组
let array2 : [String] = ["Norman", "Lavie"]

声明一个Array类型有如下两种写法，可以任选其一：
//语法糖
var array1 : [String]
var array2 : Array<String>

声明的数组需要进行初始化才能使用，数组类型往往是在声明的同时进行初始化的：

//定义的同时直接进行初始化
var array1 = ["Norman", "Lavie"]

//先定义，然后初始化
var array2 : Array<String>
array2 = ["Norman", "Lavie"]

注意区分数组和元组。

数组的基本操作

var array = ["Norman", "Lavie", "绪雨成澜"]

//获取长度
array.count // 3

//判空
array.isEmpty // false

//尾部添加元素
array.append("大鱼") // ["Norman", "Lavie", "绪雨成澜", "大鱼"]

//指定位置插入元素
array.insert("Bruce", at: 1) // ["Norman", "Bruce", "Lavie", "绪雨成澜", "大鱼"]

//删除元素
array.remove(at: 0)
array.removeLast()
array.removeFirst()

//修改元素array[0] = "小李"

//取值（直接通过下标索引取值）
print(array[0])print(array[1])

//倒序array.reverse()

数组的遍历

var array = ["Norman", "Lavie", "绪雨成澜", "大鱼"]

//for-in遍历下标
for i in 0..<array.count {
    print(array[i])
}

//for-in遍历元素
for name in array {
    print(name)
}

//遍历某区间内的元素
for name in array[0...2] {
    [print(name)]
}

//元组方式的遍历(如果既需要拿到索引又需要拿到元素，推荐使用该方式)
for (index, name) in array.enumerated() {
    print(index)
    print(name)
}

数组的合并

var array1 = ["Norman", "Lavie"]
var array2 = ["绪雨成澜", "大鱼"]
array1 += array2
print(array1) // ["Norman", "Lavie", "绪雨成澜", "大鱼"]

虽然仅仅用一个加号就可以实现数组的合并，但是一定要保证一点：要合并的两个或者多个数组的元素类型必须要保持一致。

字典

字典是由键值对（key:value）组成的集合，它由两部分集合构成：一个是键集合，一个是值集合。字典是通过访问键来间接访问值的，键集合中是不可以有重复元素的，而值集合中的元素是可以重复的。
字典中的元素是无序的。
Swift中的字典类型是Dictionary，是一个泛型集合。

字典的初始化

在Swift中，使用let修饰的字典是不可变字典，使用var修饰的字典是可变字典：
//定义一个可变字典
var dic1 : [String : Any] = [String : Any]()

//定义一个不可变字典
let dic2 : [String : Any] = ["name" : "Norman", "age" : 28]

在声明一个字典的时候，有下面两种方式，可以任选其一：
var dic : [String : Any]
var dic : Dictionary<String, Any>

跟数组一样，声明的字典也是需要初始化之后才能使用：

//声明的同时进行初始化
var dic1 : [String : Any] = [String : Any]()

//先声明，后初始化
var dic : Dictionary<String, Any>
dic = ["name" : "Norman", "age" : 28]

额外说一点，在Swift中，任意类型是使用Any来表示的。

字典的基本操作

var dict : [String : Any] = ["name" : "Lavie", "age" : 18, "gender" : "male"]

//长度
print(dict.count)

//判空
print(dict.isEmpty)

//添加元素
dict["height"] = 178
dict["weight"] = 65

/* * 需要注意的是，上面添加元素的这种方式，如果Key值不存在，那么就是添加元素； * 如果Key值存在，那么就是修改元素 */


//删除元素
dict.removeValue(forKey: "age") // 删除指定元素
dict.removeAll() // 删除所有元素

//修改字典
dict["name"] = "Norman" // 方式一
dict.updateValue("大鱼", forKey: "name") // 方式二


//查询字典print(dict["name"])

字典的遍历

var dict : [String : Any] = ["name" : "Lavie", "age" : 18, "gender" : "male"]

//遍历字典中所有的Value值
for value in dict.values {
    print(value)
}

//遍历字典中所有的Key值
for key in dict.keys {
    print(key)
}

//遍历所有的键值对
for (key, value) in dict {
    print(key)
    print(value)
}

字典的合并

前面讲的字符串和数组，都是可以直接使用加号+来进行合并的，但是这一点对于字典并不适用。字典是不可以直接使用加号+来进行合并的。



字典应该使用如下方式来合并：
var dict1 : [String : Any] = ["name" : "Lavie", "age" : 18, "gender" : "male"]
var dict2 : [String : Any] = ["height" : 178, "weight" : 65]

for (key, value) in dict2 {
    dict1[key] = value
}
print(dict1) // ["gender": "male", "age": 18, "weight": 65, "height": 178, "name": "Lavie"]
但是这种合并字典的方式需要特别注意，如果有Key重名，那么该Key在原字典中所对应的Value值将被新字典中所对应的Value值覆盖。

可选型

在OC中，如果一个变量暂时不使用，可以赋值为0（基本数据类型）或者赋值为nil（对象类型）。在OC中，nil就表示一个空指针，它并不作为一个特殊的类型。
在Swift中，nil是一个特殊的类型，它与Int、String一样，都是一种类型。并且Swift语言又是一种强类型语言，因此不能直接将nil赋值给其他类型的数据。
在开发中，碰到nil在所难免，因此Swift推出了可选类型。 

可选类型的取值有如下两种：
• 无值的情况下——nil
• 有值的情况下——正常取值

定义可选类型

//写法一：官方定义方式
var a : Optional<Int> = 6 // 有值
a = nil // nil


//写法二：语法糖（直接在类型后面加问号?）
var b : Int? = 8 // 有值
b = nil // nil

可选类型的使用

给可选类型赋值:

// 定义可选类型
var name : String? = nil

//给可选类型赋值
name = 123 // ❌错误写法，可选类型也是有类型校验的，这里只能复制字符串，赋值其他类型都会报错
name = "norman" // 正确


// 打印结果
print(name) // Optional("norman")  因为是可选类型，所以会带Optional

取出可选类型的值（显性解包）：

// 定义可选类型

var name : String? = "Norman"
print(name) // Optional("norman")

//取出可选类型的真实值//使用！强制解包（显性解包）
print(name!) // Norman

//如果可选类型为nil，强制解包会出错
name = nil//print(name!) // 报错：Unexpectedly found nil while unwrapping an Optional value

//正确写法应该先判空
if name != nil {
    print(name!)
}

取出可选类型的值（隐式解包）：
Swift中有一个if-let写法，if-let就是专门用于做可选绑定（隐式解包）的，如下：
if let 常量 = 可选型 {    //处理常量}
这里的【常量 = 可选型】语句的作用是：如果可选型的值不是nil，那么就将可选型的真实值传给常量，并且执行花括号{}里面的语句；如果可选型的值是nil，那么【常量 = 可选型】这个条件就不成立（因为不能直接给一个非可选型变量赋值为nil），那么就不会走到花括号里面的内容。
// 定义可选类型

var name : String? = "Norman"


/* *可选绑定（隐式解包） */
if let name = name {
    print(name)
}
强烈推荐使用可选绑定来对可选型进行隐式解包！

与if-let相对应的，有一个guard-let，其具体使用方式如下：

guard let 常量 = 可选型变量 else {
    //当可选型是nil的时候，会执行到花括号里面的语句
    return
}

//处理【常量】(只有当可选型有值的时候才会走到这一步，可选型为nil的时候不会走到这一步)

类型转换

基础数据类型转换

比如Double转Int，Int转Float等，只需要使用数据类型(待转类型)即可：
//Int转Double
var a : Int = 6
var b : Double = Double(a)

//Float转Int
var c : Float = 8.99
var d : Int = Int(c)

基础类型与字符串转换

//字符串插值可以直接将基础类型转换成字符串
var age : Int = 6
var str = "小明今年\(age)岁了"

//字符串转成基本类型，必须要保证字符串的内容是可以转换的
var string = "123"
var d = Int(string)

Any、AnyObject
• Any是一个空协议集合的别名，它没有实现任何的协议，因此它可以是任何类型，包括类类型 与结构体类型，甚至可以表示函数类型。
• AnyObject是一个成员为空的协议，任何对象都实现了这个协议，它可以表示任何类类型的实例对象。

类型转化符号
• is，类型检查操作符，用于检查一个实例是否属于一个特定的类。如果实例是该类类型，类型检查操作符返回true，否则返回false。
• as，类型转换操作符，用于进行向下类型转换至其子类类型。分为as?和as!——如果不确定向下转换类型是否能够成功，使用条件形式的类型转换操作符as? ；如果确定向下转换类型会成功时，使用强制形式的类型转换操作符as! 。

下面来看一段实例：
//1，定义一个数组
let array : [Any] = [18, "norman"]

//2，取出第一个元素和最后一个元素
let firstObject = array.first
let lastObject = array.last


//3，判断元素类型
print(firstObject is Int) // true
print(firstObject is String) // false
print(lastObject is Int) // false
print(lastObject is String) // true


//4，转成真正的类型来使用//4.1，as? 转成可选类型，通过判断可选类型是否有值，来决定是否转换成功
let name = lastObject as? String

print(name) // Optional("norman")

let age = firstObject as? String

print(age) // nil

//4.2，as! 转成具体类型，如果不是该类型（即转换失败），那么程序就会报崩溃
let name = lastObject as! String

print(name) // norman

关于上述实例，有以下几点需要说明。

1，我们之前提到，数组中的元素必须是相同的类型，但是这里我在定义数组的时候，其中的元素是不同类型的，但是也能正常编译运行，是因为我给数组中的元素定义的是 Any 类型，这就表示数组中的元素可以是任意类型。

2，as? 表示的是转换成可选型，也就是说，转换成功的话就是计划转换成的具体类型，转换不成功的话就是nil。如果不确定向下转换能否成功，那么就使用条件形式的类型转换操作符 as?

3，as! 表示的是转成具体类型，相当于对使用as?转换成的可选型进行强制解包，我们知道当强制解包的时候，如果值不存在就会崩溃，使用as!进行强制转换成某具体类型，当转换出错的时候，也会报崩溃。因此，如果你能百分百确定肯定能转成功，那么就使用as! ，否则就是用as? 。

其他实用的一些知识点

检查一个整数是否是另一个整数的倍数

let a = 6
a.isMultiple(of: 3) // true
a.isMultiple(of: 4) // false

检查一个整数是否是另一个整数的倍数，可以通过取余来做到，但是Swift5中直接给我们提供了这么一个方法。

随机数

let randomInt = Int.random(in: 1...10) // 4
let randomDouble = Double.random(in: 1...10) // 5.277488860322416
let randomFloat = Float.random(in: 1...10) // 7.261972
let randowBool = Bool.random() // true

var names = ["norman", "lavie", "Bruce"]
// 对数组元素进行重新随机排序，重新返回一个数组
let namesShuffles = names.shuffled()

布尔切换

var isOn = true//toggle函数是将布尔值转反，该函数没有返回值，isOn.toggle()//false
isOn.toggle()//true

