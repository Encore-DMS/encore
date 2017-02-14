classdef Source < encore.core.AnnotatableEntity
    
    properties
        label
    end
    
    methods
        
        function obj = Source(cobj)
            obj@encore.core.AnnotatableEntity(cobj);
        end
        
        function l = get.label(obj)
            l = char(obj.cobj.getLabel());
        end
        
        function set.label(obj, l)
            obj.cobj.setLabel(l);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.SOURCE;
        end
        
    end
    
end

