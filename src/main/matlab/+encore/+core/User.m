classdef User < encore.core.Entity
    
    properties (SetAccess = private)
        username
    end
    
    methods
        
        function obj = User(cobj)
            obj@encore.core.Entity(cobj);
        end
        
        function n = get.username(obj)
            n = char(obj.cobj.getUsername());
        end
        
    end
    
end

