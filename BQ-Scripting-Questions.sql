"""
QUESTION 1: Running Sum of 1d Array
Link: https://leetcode.com/problems/running-sum-of-1d-array/

Example: 
    Input: nums = [1,2,3,4]
    Output: [1,3,6,10]
    
"""
DECLARE list ARRAY <INT64> DEFAULT [1,3,4,7];
DECLARE answer ARRAY <INT64> DEFAULT [];
DECLARE i INT64 DEFAULT 0;
DECLARE cumSum INT64 DEFAULT 0;

SET answer = ARRAY_CONCAT(answer, [list[ORDINAL(1)]]);

LOOP
  SET i = i + 1;
  
  IF i > ARRAY_LENGTH(list) 
    THEN LEAVE; 
  END IF;
  
  SET cumSum = cumSum + list[ORDINAL(i)];
  SET answer = ARRAY_CONCAT(answer,[cumSum]);
  
END LOOP;

SELECT answer


"""
QUESTION 2: Kids with the Greatest Number of Candies
Link: https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/

Example: 
    Input: candies = [2,3,5,1,3], extraCandies = 3
    Output: [true,true,true,false,true]

"""
DECLARE list ARRAY <INT64> DEFAULT [2,3,5,1,3];
DECLARE extraCandies INT64 DEFAULT 3;
DECLARE maxNum DEFAULT 0;
DECLARE i INT64 DEFAULT 0;
DECLARE newList ARRAY <INT64> DEFAULT [];
DECLARE answer ARRAY <BOOL> DEFAULT [];
DECLARE tempVar BOOL;

-- Step 1: Find Max in array
SET maxNum = (SELECT MAX(x) FROM UNNEST(list) as x);

-- Step 2: Add extraCandies to each element in array
LOOP
  SET i = i + 1;
  IF i > ARRAY_LENGTH(list) THEN LEAVE;
  END IF;
  
  SET newList = ARRAY_CONCAT(newList, [list[ORDINAL(i)] + extraCandies]);
END LOOP;

-- Step 3: Iterate through array
SET i = 0;
LOOP
  SET i = i + 1;
  IF i > ARRAY_LENGTH(newList) THEN LEAVE;
  END IF;
  
  IF newList[ORDINAL(i)] >= maxNum
    THEN SET tempVar = true;
  ELSE SET tempVar = false;
  END IF;

  SET answer = ARRAY_CONCAT(answer, [tempVar]);
  
END LOOP;

SELECT answer


"""
QUESTION 3: Shuffle the Array
Link: https://leetcode.com/problems/shuffle-the-array/

Example: 
    Input: nums = [2,5,1,3,4,7], n = 3
    Output: [2,3,5,4,1,7] 
    
"""
