package kr.co.bitcamp.object4;

public class IpadTest {
public static void main(String[] args) {
    
    Ipad ipad = new Ipad();
    
    ipad.setCompany("애플");
    ipad.setModel("ipadPro4세대");
    ipad.setRelease(2021);
    ipad.setColor("로즈골드");
    System.out.println(ipad);
    
    Ipad ipad2 = new Ipad();
    ipad2.setCompany("삼성");
    ipad2.setModel("S패드");
    ipad2.setRelease(2020);
    ipad2.setColor("골드");
    System.out.println(ipad2);
    
//      Ipad ipad = new Ipad();
//      
//      ipad.setColor("losepink");
//      ipad.setCompany("애플");
//      ipad.setModel("ipadPro4세대");
//      ipad.setYear(2021);
//      System.out.println(ipad);
//  
//        Ipad ipad = new Ipad();
//        
//        ipad.setColor("화이트실버");
//        ipad.setCompany("애플");
//        ipad.setCompany("삼성");
//        ipad.setModel("Ipad4세대");
//        ipad.setModel("Ipad4");
//        ipad.setYear(2020);
//        System.out.println(ipad);
        
    
    }
    
}
