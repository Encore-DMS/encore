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
    
end

