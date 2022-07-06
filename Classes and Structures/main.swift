//
//  Classes_and_StructuresApp.swift
//  Classes and Structures
//
//  Created by MacBook Air on 2022/07/05.
//

class SomeClass {

// 클래스 내용은 여기에

}

struct SomeStructure {

// 구조체 내용은 여기에

}


// 아래는 각각 구조체 선언과 클래스 선언의 예이다.

struct Resolution {

var width = 0

var height = 0

}

class VideoMode {

var resolution = Resolution( ) // 위 Resolution 구조체를 값으로 사용

var interlaced = false

var frameRate = 0.0

var name: String?

}

// 구조체 Resolution의 프로퍼티 width와 height는 초기 값으로 0을 할당했기 때문에 Swift의 타입추론에 의해
// 자동으로 Int형을 가지게 된다.

let someResolution = Resolution( ) // 구조체 인스턴스 생성

let someVideoMode = VideoMode( ) // 클래스 인스턴스 생성

// 점 문법을 통해 클래스/구조체 인스턴스의 프로퍼티에 접근할 수 있다.

print("The width of someResolution is \(someResolution.width)")

// “The width of someResolution is 0”이 출력된다.

// 하위레벨 프로퍼티도 점(.)문법을 이용해 접근할 수 있다.

print("The width of someResolution is \(someVideoMode.resolution.width)")
      
// 점문법을 이용해 값을 할당할 수 있다.

someVideoMode.resolution.width = 1280

print("The width of someResolution is \(someVideoMode.resolution.width)")

// “The width of someVideoMode is now 1280” 이 출력
      
// 구조체형의 멤버 초기화

let vga = Resolution(width: 640, height: 480)
      
// 구조체와 열거형은 값 타입
      
let hd = Resolution(width : 1920, height: 1080)

var cinema = hd
      
// 하지만 원본이었던 hd의 width 값은 여전히 원래 값인 1920을 가지고 있다. 이것은 두 인스턴스(cinema, hd)가 완전히 다른 개체로 다른
// 주소 공간에 저장되어 사용된다는 것을 보여준다.


// 열거형에서의 동작도 마찬가지이다.
enum CompassPoint {

case north, south, east, west

}

var currentDirection = CompassPoint.west

let rememberedDirection = currentDirection

currentDirection = .east

if rememberedDirection == .west {

print("The remembered direction is still .west")

}
      
// currentDirection에 west를 할당하고 나서 remberedDirection에 currentDirection의 값(west)를 저장한다. 그리고 후에. currentDireciton의 값을 east로 변경한다. 다음 과정인 if 문을 사용하여 rememberedDirection이 west 값을 가지고 있는지 확인해보면 값이 그대로인 것을 확인할 수 있다.

// 이처럼 해당 인스턴스의 변경은 해당되는 것에만 영향을 끼칠 뿐  그것과 다른 인스턴스에는 아무런 영향을 끼치지 않는다.


// 클래스는 참조 타입

let tenEighty = VideoMode( ) // tenEighty라는 VideoMode 클래스 인스턴스를 생성

tenEighty.resolution = hd // 각 프로퍼티에 값을 할당

tenEighty.interlaced = true

tenEighty.frameRate = 25.0

// tenEighty라는 VideoMode 클래스 인스턴스를 생성하고 각 프로퍼티에 값을 할당한다.

let alsoTenEighty = tenEighty

alsoTenEighty.frameRate = 30

// alsoTenEighty 라는 상수를 만들고 그것에 위에서 선언한 tenEighty 클래스 인스턴스를 할당한다. 그리고 나서 alsoTenEighty의 framerate를 30으로 변경한다. 위에서 변경한 이 값은 25로 되어있다.

// 해당 값의 결과는 ?

print("\(tenEighty.frameRate)")

// tenEighty.frameRate는 30으로 출력

// 이유는 다음과 같다. alsoTenEighty가 tenEighty의 인스터스를 복사한 것이 아닌 참조한 것이기 때문이다. alsoTenEighty는 tenEighty가 바라보고 있는 메모리 주소를 동일하게 바라보고 참조한 것이다.  alsoTenEighty 자체를 변경한 것이 아니라 그것이 바라보는 값을 변경했기 때문에 가능한 것이다.

// 식별 연산자 (Identity Operators)

if tenEighty === alsoTenEighty {

print("같은 인스턴스를 참조하고 있습니다")

}

// String, Array, Dictionary 같은 기본 데이터 타입은 구조체로 구현되어있다. 그렇다는 의미는 이 값을 다른 상수나 변수에 할당되거나 함수나 메소드에 인자로 넘길 때 이 값이 복사된다는 것이다. 반면에, Foundation의 NSString, NSArray, NSDictionary 는 클래스로 구현되어 있다. 그래서 이 데이터들은 항상 할당되거나 전달될 때 복사되지 않고 참조된다.

      
let input = readLine()
let n = Int(readLine()!)!

