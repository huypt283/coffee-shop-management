package com.team5;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 *
 * @author huypt
 */
public class MatchPasswordTest {
    private BCryptPasswordEncoder bcpe;
    
    @Before
    public void setUp() {
        bcpe = new BCryptPasswordEncoder();
    }
    
    @Test
    public void testMatch() {
        String password = "huypt";
        String encryptPw = bcpe.encode(password);
        assertTrue("Successful!", bcpe.matches(password, encryptPw));
    }
}
