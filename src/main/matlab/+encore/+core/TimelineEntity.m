classdef TimelineEntity < encore.core.ResourceAnnotatableEntity
    
    properties (SetAccess = private)
        startTime
        endTime
    end
    
    methods
        
        function obj = TimelineEntity(cobj)
            obj@encore.core.ResourceAnnotatableEntity(cobj);
        end
        
        function t = get.startTime(obj)
            t = obj.datetimeFromZonedDateTime(obj.cobj.getStartTime());
        end
        
        function t = get.endTime(obj)
            cendTime = obj.cobj.getEndTime();
            if ~isempty(cendTime)
                t = obj.datetimeFromZonedDateTime(cendTime);
            else
                t = [];
            end
        end
        
    end
    
end

