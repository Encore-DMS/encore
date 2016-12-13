classdef Project < encore.core.CoreObject
    
    properties
        name
        purpose
    end
    
    methods
        
        function obj = Project(cobj)
            obj@encore.core.CoreObject(cobj);
        end
        
        function n = get.name(obj)
            n = char(obj.cobj.getName());
        end
        
        function set.name(obj, n)
            obj.cobj.setName(n);
        end
        
        function p = get.purpose(obj)
            p = char(obj.cobj.getPurpose());
        end
        
        function set.purpose(obj, p)
            obj.cobj.setPurpose(p);
        end
        
    end
    
end

