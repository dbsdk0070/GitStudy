package kr.co.bitcamp.object4;

public class IpadTestPR {
    public static void main(String[] args) {
        
    

    IpadPR ipad = new IpadPR();
    
    ipad.setCompany("삼성");
    ipad.setColor("로즈실버");
    ipad.setModel("ipad5");
    ipad.setRelease(2020);
    System.out.println(ipad);
    
    IpadPR ipad2 = new IpadPR();
    
    ipad2.setColor("로즈골드");
    ipad2.setCompany("애플");
    ipad2.setModel("Ipad4");
    ipad2.setRelease(2021);
    System.out.println(ipad2);
    

 
    }
    
}
