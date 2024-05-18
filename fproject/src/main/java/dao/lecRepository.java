package dao;

import java.util.ArrayList;
import dto.Lec;

public class lecRepository{
	private ArrayList<Lec> listOfLectures = new ArrayList<Lec>();
	
	public lecRepository() {
		Lec lec1 = new Lec();
		lec1.setTeacherName("김영한");
		lec1.setLecCategory("자바");
		lec1.setLecLevel("초급");
		lec1.setLecReviewCount(0);
		lec1.setLecDescription(null);
		
		listOfLectures.add(lec1);
		
	}
	
    public ArrayList<Lec> getAllLectures() {
        return listOfLectures;
	}
    
    /*
   		//강의의 카테고리, 필드에 따라 강의ID를 만들어주기 위해 리스트를 선언합니다.
		List<List<String>> list = new ArrayList<>();
		
		list.add(new ArrayList<String>());
		list.add(new ArrayList<String>());
		list.add(new ArrayList<String>());
		list.add(new ArrayList<String>());
		
		list.get(0).add("")
		
       
        
        for (int i=1; i<=4; i++){
        	if (numField == i){
        		lecId = i * 1000000;
        	}
        	if (lecCategory.equals())
        }
     */
    

}