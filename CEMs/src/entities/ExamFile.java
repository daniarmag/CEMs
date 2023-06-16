package entities;

import java.io.Serializable;

/**
 * Represents the exam file.
 */
@SuppressWarnings("serial")
public class ExamFile implements Serializable {
	private String fileName=null;	
	private int size=0;
	public  byte[] mybytearray;
	
	/**
     * Constructor for ExamFile object.
     * @param fileName the name of the exam file
     */
	public ExamFile( String fileName) {
		this.fileName = fileName;
	}
	
	/**
     * Initializes the byte array.
     * @param size the size of the byte array
     */
	public void initArray(int size)
	{
		mybytearray = new byte [size];	
	}
	
	/**
     * @return the name of the exam file
     */
	public String getFileName() {
		return fileName;
	}

	/**
     * @return the size of the exam file
     */
	public int getSize() {
		return size;
	}
	
    /**
     * @return the byte array representing the contents of the exam file
     */
	public byte[] getMybytearray() {
		return mybytearray;
	}
	
    /**
     * @param i the index of the byte
     * @return the byte at the specified index
     */
	public byte getMybytearray(int i) {
		return mybytearray[i];
	}

	/**
     * @param fileName the name of the exam file to set
     */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
     * @param size the size of the exam file to set
     */
	public void setSize(int size) {
		this.size = size;
	}

    /**
     * @param mybytearray the byte array to set
     */
	public void setMybytearray(byte[] mybytearray) {
		
		for(int i=0;i<mybytearray.length;i++)
		this.mybytearray[i] = mybytearray[i];
	}
}

