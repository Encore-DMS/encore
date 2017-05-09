classdef ResourceAnnotatableEntity < encore.core.AnnotatableEntity
    
    properties
    end
    
    methods
        
        function obj = ResourceAnnotatableEntity(cobj)
            obj@encore.core.AnnotatableEntity(cobj);
        end
        
        function r = addResource(obj, name, data, uri)
            cr = obj.tryCoreWithReturn(@()obj.cobj.addResource(name, data, uri));
            r = encore.core.Resource(cr);
        end
        
        function removeResource(obj, name)
            
        end
        
        function r = getResources(obj)
            r = [];
        end
        
        function r = getResource(obj, name)
            r = [];
        end
        
        function n = getResourceNames(obj)
            n = [];
        end
        
    end
    
end

