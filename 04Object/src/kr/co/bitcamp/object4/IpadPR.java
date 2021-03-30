package kr.co.bitcamp.object4;

public class IpadPR {
    
    private String company;
    private String model;
    private String color;
    private int release;
    
    
    public String getCompany() {
        return company;
    }
    public void setCompany(String company) {
        if(!company.equals("애플")) {
            System.out.println("애플제조회사가 아닙니다.");
            return;
        }
        this.company = company;
    }
    
    
    public String getModel() {
        return model;
    }
    public void setModel(String model) {
        if(!(model.equals("Ipad4") || model.equals("Ipad5"))) {
            System.out.println("애플제조사 모델이 아닙니다.");
            return;
        }
        this.model = model;
    }
    
    
    public String getColor() {
        return color;
    }
    public void setColor(String color) {
        this.color = color;
    }
    
    
    public int getRelease() {
        return release;
    }
    public void setRelease(int release) {
        this.release = release;
    }
    
    public String toString() {
        return this.getCompany() + "회사의" +
               this.getModel() + "모델이고" +
               this.getRelease() + "년식입니다." +
               this.getColor() + "컬러입니다.";
    }
    
    
    

}
