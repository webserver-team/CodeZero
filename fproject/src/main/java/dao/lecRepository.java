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
    

}