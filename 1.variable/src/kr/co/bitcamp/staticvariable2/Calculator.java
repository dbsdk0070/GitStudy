package kr.co.bitcamp.staticvariable2;

public class Calculator {

    // 인스턴스 메서드 (static 없으니까)
    // 특징: new연산자로 객체, 인스턴스를 생성해야지만 "참조변수명.인스턴스메서드()" 접근가능 
    public int add(int x, int y) {
        double result = Calculator.divid(10.5, 11.7);
        System.out.println("인스턴스 메소드내에서 static메서드 호출 : " + result);
        return x + y;
    }
    
    // 인스턴스 메서드
    public int substract(int x, int y) {
        return x - y;
    }
    
    // static(정적) 메서드 추가하기 --> return타입(ex-long) 앞에 붙인다.
    // 특징: 인스턴스 생성 없이 "클래스명.정적메서드명()"으로 바로 접근이 가능함.
    //      static은 바로 메모리상으로 올라가기 때문에 this. 사용할 수 없음
    // static 메서드는 객체 생성과 상관 없이 이미 메모리 상단에 올라가있고 인스턴스 생성 없이 접근이 가능해야 되는데
    // 아래 코드는(add) 인스턴스가 생성되어야지만 새용가능한 add()가 호출하기때문에 예외가 발생한것이다.
    // 인스턴스가 언제 생성될지 아무도 모르기때문에 static(multiply)메서드 안에는 인스턴스 메서드가 절대 오면 안된다.
    
    public static long multiply(long x, long y) {
        //this.add(10, 5)
        return x * y;
    }
    
    public static double divid(double x, double y) {
        return x / y;
    }

    
    
    
    
    
}
