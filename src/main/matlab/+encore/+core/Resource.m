classdef Resource < encore.core.ResourceAnnotatableEntity
    
    properties (SetAccess = private)
        name
        uti
    end
    
    methods
        
        function obj = Resource(cobj)
            obj@encore.core.ResourceAnnotatableEntity(cobj);
        end
        
        function n = get.name(obj)
            n = char(obj.cobj.getName());
        end
        
        function i = get.uti(obj)
            i = char(obj.cobj.getUti());
        end
        
    end
    
end

