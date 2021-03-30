package kr.co.bitcamp.staticvariable2;

public class Member {
    
    // 변수의 2가지 타입 정의 (static이 붙냐 안붙냐)
    int iv = 100;               // 인스턴스 멤버 변수
    static int cv = 300;        // static 멤버 변수
    
//    // 인스턴스 메소드 --> 인스턴스 메소드, static메소드 모두 실행 가능(static변수는 이미 메모리에 올라가져있기 때문)
//    public void iMethod() {
//        System.out.println("iv : " + this.iv);          
//        System.out.println("cv : " + Member.cv);        // 클래스명.정적변수명
//                                                        
//    }
    
    public void iMethod() {
        System.out.println("iv:"+this.iv);
        System.out.println("cv:"+Member.cv);
    }
    
    // static 메소드
    public static void sMethod() {
     //System.out.println("iv : " + this.iv);          // 호출 안됨. this쓸 수 없음
                                                       // static은 이미 메모리로 올라가져있어 호출되지만, 인스턴스 변수는 언제 인스턴스가 만들어질지는 아무도 모르기때문.
    
     /*
      * cv는 static 변수이기 때문에 인스턴스 생성 없이 접근가능해야함
      * static 메서드 내에서는 얼마든지 접근 가능함.   
      */
        
        System.out.println("cv : " + Member.cv);
    }
    
    
    
    
    
    
    
    
    

}
