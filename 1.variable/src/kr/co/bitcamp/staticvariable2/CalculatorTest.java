package kr.co.bitcamp.staticvariable2;

public class CalculatorTest {

    public static void main(String[] args) {
        
        Calculator cal = new Calculator();
        
        // 일반적인 인스턴스 메소드 호출
        int addResult = cal.add(100, 200);
        System.out.println("인스턴스 메서드 add() 호출 결과" + addResult);
        
        long mulResult = Calculator.multiply(100, 20);
        System.out.println("static 메서드 multiply() 호출 결과" + mulResult);
        
        double divResult = Calculator.divid(100.2, 10.2 );
        System.out.println("static 메서드 multiply() 호출 결과" + divResult);
        

        Integer.parseInt("100");
        Math.random();
    }

}
