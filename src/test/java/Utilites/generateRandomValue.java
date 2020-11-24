package Utilites;

import java.util.Random;

public class generateRandomValue {
	public static String randomStringGenerarot(int noOfChar) {
		String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		StringBuilder sb = new StringBuilder(noOfChar);
		for (int i = 0; i < noOfChar; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		return sb.toString();
	}

	public static int randomIntegerGenerarot(int noOfChar) {
		int finalVal = 0;
		String AlphaNumericString = "0123456789";
		StringBuilder sb = new StringBuilder(noOfChar);
		for (int i = 0; i < noOfChar; i++) {
			int index = (int) (AlphaNumericString.length() * Math.random());
			sb.append(AlphaNumericString.charAt(index));
		}
		finalVal = Integer.parseInt(sb.toString());
		return finalVal;
	}
}
