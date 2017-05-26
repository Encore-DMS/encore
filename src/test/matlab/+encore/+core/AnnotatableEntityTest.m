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
        
        function testAddProperties(obj)
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
            
            actual = obj.entity.getUserProperties(obj.user);
            
            obj.verifyEqual(actual, expected);
        end
        
        function testRemoveProperties(obj)
            expected = containers.Map();
            expected('one') = 'one';
            expected('two') = 2.2;
            expected('three') = [1; 2; 3];
            expected('four') = struct('a', 3');
            
            keys = expected.keys;
            for i = 1:numel(keys)
                obj.entity.addProperty(keys{i}, expected(keys{i}));
            end
            
            obj.entity.removeProperty('two');
            expected.remove('two');
            
            obj.entity.removeProperty('four');
            expected.remove('four');
            
            actual = obj.entity.getUserProperties(obj.user);
            
            obj.verifyEqual(actual, expected);
        end
        
    end
    
end

