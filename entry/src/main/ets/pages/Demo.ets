// 语法学习

// 变量
let str: string = 'hello world';
str = 'hi world';
console.log(`${str}`);

// 常量
const STR: string = 'HI';
// STR = '' 错误用法

// number && Number
let i: number = 10;
// 十进制
let n: Number = 11;
// 浮点数
let e: number = 0.02;
let e1: number = .5;
let e2: number = 1e10;
// 十六进制
let m: number = 0xff || 0Xff;
// 八进制
let g: number = 0o11 || 0O11;
// 二进制
let u: number = 0b101010101 || 0B101010101;
// boolean
let b: boolean = true || false;

// void，用于指定函数没有返回值
class Person<T> {

}
// 因为是引用类型，也可作为泛型
let instance: Person<void>;
new Person<void>();

// object，所有引用类型基类
new Object();

// Array，数组
let names: string[] = ['hi', 'world', '!!!'];

// enum，枚举
enum ColorSet { RED, GREEN, BLUE };
let c: ColorSet = ColorSet.RED;

// union 类型
class Red { color() { return 'red'; } }
class Green { color() { return 'green'; } }
class Blue { color() { return 'blue'; } }
interface ColorService {}
class ColorServiceImpl implements ColorService {}
// 可以是类或者接口
type Color = Red | Green | Blue | ColorService;
let color: Color = new Red();
color = new Green();
color = new ColorServiceImpl();
color = 10;
if (color instanceof Red) {
  let c1: Green = color as Green;
  console.log(c1.color());
  console.log(color.color());
}

// Aliases 类型，匿名类型
type Matrix = number[][];
type Handler = (s: string, no: number) => string;
type Predicate<T> = (x:T) => Boolean;
type NullableObject = Object | null;

/*
赋值运算符：=
复合赋值运算符：-=、+=、*=、/=、%=、<<=、>>=、>>>=、&=、|=、^=
比较运算符：==、!=、>、>=、<、<=、
算术运算符：+、-、*、/
二元运算符：+、-、*、/、%
位运算符：&（都为1，则为 1）、|（两者有 1 则为 1）、^（不同为 1，相同为 0）、~（反转）、>>（右移）、<<（左移）、>>>（逻辑右移，左边补 0）
逻辑运算符：||、&&、!
 */

// 语句：if、switch、条件表达式、for、for-of、while、do-while、break、continue、throw、try、finally

// 函数
function add(x: string, y: string): string {
  return `${x} + ${y}`;
}
// 可选参数
function setName(name?: string) {
  if (name == undefined) {
    console.log('hello');
  } else {
    console.log(`hello, ${name}`);
  }
}
function person(name: string, age: number = 0): void {
}
person('sun');
person('children', 5);
function funList(numList: number[]): number {
  let sum = 0;
  for (let num of numList) {
    sum += num;
  }
  return sum;
}
funList([1, 2, 3]);
function funList_01(...numList: number[]): number {
  let sum = 0;
  for (let num of numList) {
    sum += num;
  }
  return sum;
}
funList_01(1, 2, 3);
// 函数类型，通常用于定义回调
type funType = (x: number) => number;
function do_action(f: funType) {
  f(3.1415926535);
}
// 将函数作为参数传入
do_action(Math.sin)
// 箭头函数或 lambda 函数
let sum = (x: number, y: number): number => {
  return x + y;
}
// 等价于 sum 函数
let sum01 = (x: number, y: number) => x + y;
console.log(`sum: ${sum(1, 2)}`);
// 闭包
function f(): () => number {
  let count = 0;
  let g = (): number => { count++; return count; }
  return g;
}
let z = f();
z();
z();













