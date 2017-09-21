package com.test.spring;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class CalTest {

   Cal c;

   @Before
   public void setUpBefore() throws Exception {
      System.out.println(c);
      c = new Cal();
      System.out.println(c);
   }

   @Test
   public void testPlus() {
      int result = c.calPlus(10, 20);
      assertEquals("10+20=30",30, result);
   }

   @Test
   public void testMinus() {
      int result = c.calMinus(2, 1);
      assertEquals("2-1=1", 1, result);
   }

   @Test
   public void testMultiple() {
      int result = c.calMultiple(4, 2);
      assertEquals("4*2=8", 8, result);
   }
   
   @Test
   public void testDivide() {
      int result = c.calDivision(10, 2);
      assertEquals( "10/2=5",5, result);
   }
   @After
   public void setUpAfter() throws Exception {
      System.out.println(c);
      c = null;
   }
}