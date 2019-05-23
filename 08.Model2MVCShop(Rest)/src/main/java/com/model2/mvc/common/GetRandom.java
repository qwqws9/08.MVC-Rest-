package com.model2.mvc.common;

import java.util.HashSet;
import java.util.Random;

public class GetRandom {

	public static HashSet<Integer> getRandom(int size) {
		HashSet<Integer> set = new HashSet<>();
		Random ran = new Random();
		while(set.size() != 3) {
			set.add(ran.nextInt(size+1));
		}
		return set;
	}
}
