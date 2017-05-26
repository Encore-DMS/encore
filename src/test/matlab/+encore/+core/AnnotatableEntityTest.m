classdef AnnotatableEntityTest < encore.TestBase
    
    properties
        entity
        context
        user
    end
    
    methods (TestMethodSetup)
        
        function methodSetup(obj)
            coordinator = encore.core.Encore.connect('localhost', 'testUser', '');
            obj.context = coordinator.getContext();
            obj.user = obj.context.getAuthenticatedUser();
            
            obj.entity = obj.context.insertProject('test', 'testing', datetime('now', 'TimeZone', 'local'));
        end
        
    end
    
    methods (Test)
        
        function testProperties(obj)
            expected = containers.Map();
            expected('uint16') = uint16(12);
            expected('uint16v') = uint16([1; 2; 3; 4; 5]);
            expected('uint16m') = uint16([1 2 3; 4 5 6; 7 8 9]);
            expected('double') = 3.5;
            expected('doublev') = [1; 2; 3; 4];
            expected('doublem') = [1 2 3; 4 5 6; 7 8 9];
            expected('string') = 'hello world!';
            
            keys = expected.keys;
            for i = 1:numel(keys)
                obj.entity.addProperty(keys{i}, expected(keys{i}));
            end
            
            obj.verifyEqual(obj.entity.getUserProperties(obj.user), expected);
            
            obj.entity.removeProperty('double');
            expected.remove('double');
            
            obj.verifyEqual(obj.entity.getUserProperties(obj.user), expected);
        end
        
        function testKeywords(obj)
            expected = {'one', 'two', 'three'};
            
            for i = 1:numel(expected)
                obj.entity.addKeyword(expected{i});
            end
            
            obj.verifyEqual(obj.entity.getUserKeywords(obj.user), expected);
            
            obj.entity.removeKeyword('two');
            expected(2) = [];
            
            obj.verifyEqual(obj.entity.getUserKeywords(obj.user), expected);
        end
        
    end
    
end

