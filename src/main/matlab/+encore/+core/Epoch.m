classdef Epoch < encore.core.TimelineEntity
    
    properties (SetAccess = private)
        protocolParameters
    end
    
    methods
        
        function obj = Epoch(cobj)
            obj@encore.core.TimelineEntity(cobj);
            obj.protocolParameters = containers.Map();
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EPOCH;
        end
        
    end
    
end

