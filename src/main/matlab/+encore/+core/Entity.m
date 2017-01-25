classdef Entity < encore.core.CoreObject
    
    properties (SetAccess = private)
        uuid
    end
    
    methods
        
        function obj = Entity(cobj)
            obj@encore.core.CoreObject(cobj);
        end
        
        function i = get.uuid(obj)
            i = char(obj.cobj.getUuid().toString());
        end
        
    end
    
end

