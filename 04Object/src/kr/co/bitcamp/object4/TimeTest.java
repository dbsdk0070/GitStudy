package kr.co.bitcamp.object4;

public class TimeTest {

    public static void main(String[] args) {
        
        Time time = new Time();
        // time.hour = 10; (private으로 설정을 했기때문에 불가)
        
        System.out.println(time.getHour());
        System.out.println(time);
        
        // 시를 설정
        
        time.setHour(10);
        System.out.println(time);
        
        time.setHour(223);
        System.out.println(time);
        
        
        
    }
    
}
