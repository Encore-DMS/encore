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
        
        function s = insertSource(obj, label)
            cs = obj.tryCoreWithReturn(@()obj.cobj.insertSource(label));
            s = encore.core.Source(cs);
        end
        
        function s = getSources(obj)
            cs = obj.tryCoreWithReturn(@()obj.cobj.getSources());
            s = obj.cellArrayFromStream(cs, @encore.core.Source);
        end
        
        function g = insertEpochGroup(obj, source, label, startTime, endTime)
            if nargin < 5
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);
            cg = obj.tryCoreWithReturn(@()obj.cobj.insertEpochGroup(source.cobj, label, cstartTime, cendTime));
            g = encore.core.EpochGroup(cg);
        end
        
        function g = getEpochGroups(obj)
            cg = obj.tryCoreWithReturn(@()obj.cobj.getEpochGroups());
            g = obj.cellArrayFromStream(cg, @encore.core.EpochGroup);
        end
        
        function t = getEntityType(obj) %#ok<MANU>
            t = encore.core.EntityType.EXPERIMENT;
        end
        
    end
    
end

