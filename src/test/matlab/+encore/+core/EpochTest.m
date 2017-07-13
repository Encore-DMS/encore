classdef EpochTest < encore.TestBase
    
    properties
        epoch
        context
        user
    end
    
    methods (TestMethodSetup)
        
        function methodSetup(obj)
            coordinator = encore.core.Encore.connect('localhost', 'testUser', '');
            obj.context = coordinator.getContext();
            obj.user = obj.context.getAuthenticatedUser();
            
            project = obj.context.insertProject('test', 'testing', datetime('now', 'TimeZone', 'local'));
        end
        
    end
    
end

