classdef TestBase < matlab.unittest.TestCase
    
    properties
    end
    
    methods (TestClassSetup)
        
        function classSetup(obj)
            import matlab.unittest.fixtures.PathFixture;
            
            rootPath = fullfile(fileparts(mfilename('fullpath')), '..', '..', '..', '..');
            
            core = fullfile(rootPath, 'lib', 'Core');
            matlab = fullfile(rootPath, 'src', 'main', 'matlab');
            
            obj.applyFixture(PathFixture(core));
            obj.applyFixture(PathFixture(matlab));
            
            jarPath = which('encore-core.jar');
            if ~any(strcmpi(javaclasspath('-all'), jarPath))
                javaaddpath(jarPath);
            end
        end        
        
    end
    
    methods
        
        function verifyCellsAreEquivalent(obj, actual, expected)
            obj.verifyEqual(size(actual), size(expected));
            
            for i = 1:numel(actual)
                equal = zeros(1, numel(expected));
                for j = 1:numel(expected)
                    equal(j) = isequal(actual{i}, expected{j});
                end
                obj.verifyTrue(any(equal));
            end     
        end
        
    end
        
end

