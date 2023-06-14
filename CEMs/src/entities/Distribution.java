package entities;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

@SuppressWarnings("serial")
public class Distribution implements Serializable{
	private Map<String,Integer> location=new HashMap<>();
	private Range[] dArr=new Range[6]; 
	
	public Distribution() {
		
		location.put("0-54",0);
		location.put("55-65",1);
		location.put("66-75",2);
		location.put("76-85",3);
		location.put("86-95",4);
		location.put("96-100",5);
		initArr();
		
	}
	
	private void initArr() {
		dArr[0]=new Range("0-54",0);
		dArr[1]=new Range("55-65",0);
		dArr[2]=new Range("66-75",0);
		dArr[3]=new Range("76-87",0);
		dArr[4]=new Range("86-95",0);
		dArr[5]=new Range("96-100",0);
	}
	
	public void addToRange(String range,int val) {
		dArr[location.get(range)].setVal(val);
	}
	
	 public Range[] RangeArray() {
		 return dArr;
	 }
	
	 
	 @Override
	public String toString() {
		 StringBuilder string=new StringBuilder();
		 for(int i=0;i<dArr.length;i++)
			 string.append(dArr[i]+" ");
		 return string.toString();
	 }
	 
	 
	 
	public class Range implements Serializable{
		private String range;
		private int val;

		public Range(String range, int val) {
			this.range = range;
			this.val = val;
		}

		public String get_range() {
			return range;
		}

		public int get_val() {
			return val;
		}

		public void setVal(int val) {
			this.val = val;
		}

		@Override
		public String toString() {
			return range + " " + val;
		}
	}
}
