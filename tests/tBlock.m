classdef tBlock < matlab.unittest.TestCase
    
    methods (Test)

        function retrieveValue(test)
        block = createBlock('foo',3,[]);
        value = blockValue(block);
        test.verifyEqual(value,3);
        end
        
    end
    
end