classdef Project < encore.core.TimelineEntity
    
    properties
        name
        purpose
    end
    
    methods
        
        function obj = Project(cobj)
            obj@encore.core.TimelineEntity(cobj);
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
        
        function e = insertExperiment(obj, purpose, startTime, endTime)
            if nargin < 5
                cendTime = [];
            else
                cendTime = obj.zonedDateTimeFromDatetime(endTime);
            end
            cstartTime = obj.zonedDateTimeFromDatetime(startTime);            
            cexp = obj.tryCoreWithReturn(@()obj.cobj.insertExperiment(purpose, cstartTime, cendTime));
            e = encore.core.Experiment(cexp);
        end
        
        function e = getExperiments(obj)
            ce = obj.tryCoreWithReturn(@()obj.cobj.getExperiments());
            e = obj.cellArrayFromStream(ce, @encore.core.Experiment);
        end
        
    end
    
end

