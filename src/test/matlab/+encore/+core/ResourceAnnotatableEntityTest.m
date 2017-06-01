classdef ResourceAnnotatableEntityTest < encore.TestBase
    
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
        
        function testResources(obj)
            expected = {};
            expected{1} = obj.entity.addResource('first', [1 2 3]);
            expected{2} = obj.entity.addResource('second', uint8([4 5 6]));
            expected{3} = obj.entity.addResource('third', struct('f1', [7 8 9], 'f2', 'banana'));
            
            obj.verifyCellsAreEquivalent(obj.entity.getResources(), expected);
            obj.verifyEqual(obj.entity.getResource('second'), expected{2});
            obj.verifyCellsAreEquivalent(obj.entity.getResourceNames(), {'first', 'second', 'third'});
            
            obj.entity.removeResource('second');
            expected(2) = [];
            
            obj.verifyCellsAreEquivalent(obj.entity.getResources(), expected);
        end
        
    end
    
end

