import UIKit

var greeting = "Hello, playground"
/* Задание 1

1) В конце главы про “Перечисления” мы с вами начали создавать перечисление ArithmeticExpression, позволяющее выполнять арифметические операции. Сейчас перед вами стоит задача доработать данное перечисление, чтобы оно могло производить любые арифметические операции, включая сложение, вычитание, умножение, деление и возведение в степень.
2) Проверьте работу перечисления на произвольных примерах */
enum ArithmeticExpression {
    // указатель на конкретное значение
    case number( Int )
    // указатель на операцию сложения
    indirect case addition( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию вычитания
    indirect case subtraction( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию умножения
    indirect case multiply( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию деления
    indirect case division( ArithmeticExpression, ArithmeticExpression )
    // указатель на операцию возведение в степень
    indirect case exponentiation( ArithmeticExpression, ArithmeticExpression )
    // метод, проводящий операцию
    func evaluate( _ expression: ArithmeticExpression? = nil ) -> Int {
        // определение типа операнда (значение или операция)
        switch expression ?? self {
            case let .number( value ):
                return value
            case let .addition( valueLeft, valueRight ):
                return evaluate( valueLeft ) + evaluate( valueRight )
            case .subtraction( let valueLeft, let valueRight ):
                return evaluate( valueLeft ) - evaluate( valueRight )
        case let .multiply( valueLeft, valueRight ):
            return evaluate(valueLeft) * evaluate(valueRight)
        case let .division( valueLeft, valueRight ):
            return evaluate(valueLeft) / evaluate(valueRight)
        case let .exponentiation( valueLeft, valueRight ):
            return NSDecimalNumber(decimal: pow(Decimal(evaluate(valueLeft)), evaluate(valueRight))).intValue
} }
}
let hardExpr = ArithmeticExpression.addition( .number(53),
              .exponentiation( .number(2), .number(4) ) )
hardExpr.evaluate()

/* Задание 3
 
 Простейшая модель сущности “Шахматная фигура” может быть выполнена с помощью перечисления.
 1) Создайте перечисление Chessman, члены которого определяют возможные типы шахматных фигур (всего 6 типов, без учета цвета).
 2) Внутри перечисления Chessman создайте перечисление Color, определяющее возможные цвета шахматных фигур.
 3) Для каждого члена перечисления Chessman создайте связанный параметр типа Color, позволяющий указать цвет шахматной фигуры
 4) Создайте несколько экземпляров типа Chessman, каждый из которых описывает свою шахматную фигуру
 5) Напишите конструкции switch-case, способную обрабатывать параметр типа Chessman и выводить на консоль информацию о типе и цвете фигуры
 6) Создайте новую переменную и инициализируйте ей значение типа Color, вложенного в перечисление Chessman*/
//1-3
enum Chessman {
    case king(color: Color)
    case queen(color: Color)
    case knight(color: Color)
    case bishop(color: Color)
    case rook(color: Color)
    case pawn(color: Color)
    
    enum Color: String {
    case black = "Black"
    case white = "White"
    }
}
// 4
var king: Chessman = .king(color: .white)
var queen: Chessman = .queen(color: .black)
var knight: Chessman = .knight(color: .white)
var bishop: Chessman = .bishop(color: .black)
var rook: Chessman = .rook(color: .white)
var pawn:  Chessman = .pawn(color: .black)

// 5
switch king {
case .king(color: .white):
    print("White King")
case .king(color: .black):
    print("Black King")
default:
    break
}
switch queen {
case .queen(color: .white):
    print("White Queen")
case .queen(color: .black):
    print("Black Queen")
default:
    break
}
var newFigure: Chessman.Color = .black

/* Задание 4
 
 1) Создайте перечисление Day, члены которого указывают на дни недели.
 В составе перечисления создайте вычисляемое свойство, которое возвращает наименование дня недели на русском языке (значение типа String), соответсвующее выбранному члену перечисления
 2) Проверьте работу перечисления с помощью следующих выражений

 let mon = Day.monday
 print(mon.label) // Понедельник
 print(Day.friday.label) // Пятница*/
enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    var name : String {
        switch self {
        case .monday:
            return "Понедельник"
        case .tuesday:
            return "Вторник"
        case .wednesday:
            return "Среда"
        case .thursday:
            return "Четверг"
        case .friday:
            return "Пятница"
        case .saturday:
            return "Суббота"
        case .sunday:
            return "Воскресенье"
        }
    }
}
let mon = Day.friday
print(mon.name)
