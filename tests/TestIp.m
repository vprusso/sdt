classdef TestIp < matlab.unittest.TestCase
    % TestIp tests solutions of the function helpers/ip

    methods (TestClassSetup)
        function addHelpersFunctionsToPath(testCase)
            testCase.addTeardown(@path, addpath('../helpers'));
        end
    end
    
    methods (Test)
        function testIpNoArgument(testCase)
            testCase.verifyError(@()ip,'SDT:ip')
        end
        
        function testIpOneArgument(testCase)
            testCase.verifyError(@()ip(eye(2)),'SDT:ip')
        end

        function testIpScalar(testCase)
            n = 3;
            a = 10;
            actSolution = ip(a,eye(n));
            expSolution = a*n;
            testCase.verifyEqual(actSolution,expSolution);
        end

    end
    
end
