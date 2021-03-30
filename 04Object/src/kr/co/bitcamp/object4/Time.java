package kr.co.bitcamp.object4;

public class Time {

    /*
     * 접근제어자 (Access Modifier)의 종류
     *  - Private : 같은 클래스 내에서만 접근 가능함
     *  - protected : 같은 패키지, 자손 클래스에서만 접근 가능함
     *  - (default) : 같은 패키지에서만 접근 가능함.
     *  - public : 누구나 다 접근 가능함.
     * 
     */
    
    private int hour;
    private int minute;
    private int second;
    
    // getter() : 멤버변수의 값을 읽어가는 메소드
    public int getHour() {
        return this.hour;
    }
    
    // setter() : 멤버변수의 값을 수정하는 메소드(셋팅)
    public void setHour(int hour) {
        // 시에 대한 예외처리 코드를 작성
        
        if(hour < 0 || hour > 23) {
            System.out.println("시간을 잘못 입력했습니다.");
            return;
        }
        
        this.hour = hour;
    }
    
    public String toString() {
        return this.getHour() + "시 입니다.";
    }
    
  
}
    

