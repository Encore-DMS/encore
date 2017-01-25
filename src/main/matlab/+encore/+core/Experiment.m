classdef Experiment < encore.core.TimelineEntity
    
    properties
        purpose
    end
    
    methods
        
        function obj = Experiment(cobj)
            obj@encore.core.TimelineEntity(cobj);
        end
        
        function p = get.purpose(obj)
            p = char(obj.cobj.getPurpose());
        end
        
        function set.purpose(obj, p)
            obj.cobj.setPurpose(p);
        end
        
    end
    
end

